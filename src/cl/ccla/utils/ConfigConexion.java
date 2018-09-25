package cl.ccla.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.log4j.Logger;


public class ConfigConexion {
    Logger logger = Logger.getLogger(ConfigConexion.class);

    
    public Connection getConnection(){
        Connection conn = null;
        Context ctx = null;
        Hashtable<String, String> ht = new Hashtable<String, String>();
        ht.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
        try {
          logger.info("contexto inicial");
          ctx = new InitialContext(ht);
          //javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup ("jdbc/onboarding");
          javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup ("jdbc/onborqa");
          logger.info("Obtener conexion");
          conn = ds.getConnection();
          logger.info("Conexion exitosa...");
        } catch(Exception e){
          logger.error(e.getMessage(), e);
          throw new RuntimeException(e);
        }
        return conn;
      }
    
    public void closeConnection(Connection conn){
        try {
            if (conn!= null){
              conn.close();
              conn = null;
          }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }
    
    public void closeResultSet(ResultSet rs, CallableStatement stmt, Connection conn){
        try {
            if (rs!= null){
              rs.close();
              rs = null;
          }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        } finally{
            closeStatement ( stmt,  conn);
        }
    }
    
    public void closeStatement(CallableStatement stmt, Connection conn){
        try {
            if (stmt!= null){
              stmt.close();
              stmt = null;
          }
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        } finally{
          closeConnection ( conn);
        }
    }
}
