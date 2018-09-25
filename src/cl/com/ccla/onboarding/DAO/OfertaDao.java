package cl.com.ccla.onboarding.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.xml.Log4jEntityResolver;

import cl.com.ccla.onboarding.VO.EstadoCreditoVO;
import cl.com.ccla.onboarding.VO.OfertaVO;
import oracle.jdbc.OracleTypes;

public class OfertaDao {
	
	
	
	
	
	public static String ActualizaOferta(OfertaVO OfertaVo) throws SQLException  {

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			// conn=
			// DriverManager.getConnection("jdbc:oracle:thin:@telemoyo:1521:proybdev","x0gmandi","x0gm4nd1");
			
//para deploy
//			ConfigConexion config = new ConfigConexion();			
//			dbConnection = config.getConnection();
			
		 
			dbConnection = getDBConnection();
			callableStatement = dbConnection
					.prepareCall("{ ? = call ONBOARDING.PKG_ONB_OFERTA.FNC_ACTUALIZA_OFERTA (?,?,?,?,?,?)}");
		} catch (SQLException e) {
		}

		try {
			callableStatement.registerOutParameter(1,  oracle.jdbc.OracleTypes.INTEGER);
			callableStatement.setString(1, OfertaVo.getOfertacodigo());
			callableStatement.setString(2, OfertaVo.getRut());
			callableStatement.setString(3, OfertaVo.getOfertacredito());
			callableStatement.setInt(4,    OfertaVo.getIdestadoOferta());
			callableStatement.setString(5, OfertaVo.getIdusaurio());
			callableStatement.setString(6, OfertaVo.getUsuariocreacion());
		 	callableStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		  e.getMessage();
		  
		}
		finally {
			callableStatement.close();
		 	dbConnection.close();
		}
		
	 
	 	
		return "Ok";
}
	
	 
	 
	 
	public static String InsertOferta(OfertaVO OfertaVo) throws SQLException {

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			// conn=
			// DriverManager.getConnection("jdbc:oracle:thin:@telemoyo:1521:proybdev","x0gmandi","x0gm4nd1");
			
//para deploy
//			ConfigConexion config = new ConfigConexion();			
//			dbConnection = config.getConnection();
			
			dbConnection = getDBConnection();
			callableStatement = dbConnection
					.prepareCall("{ ? = call ONBOARDING.PKG_ONB_OFERTA.FNC_INSERTA_OFERTA (?,?,?,?,?,?)}");
		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1,  oracle.jdbc.OracleTypes.INTEGER);
		callableStatement.setString(1, OfertaVo.getRut());
		callableStatement.setString(2, OfertaVo.getOfertacredito());
		callableStatement.setInt(3, OfertaVo.getIdestadoOferta());
		callableStatement.setString(4, OfertaVo.getIdusaurio());
		callableStatement.setString(5, OfertaVo.getOfertacodigo());
		callableStatement.setString(6, OfertaVo.getUsuariocreacion());
	 	callableStatement.execute();
	 	
	 	callableStatement.close();
	 	dbConnection.close();
	 	
		return "Ok";
}
	
	public static String EliminaOferta(OfertaVO OfertaVo) throws SQLException {
	
		return "Exito";
		
		
	}
	
	 private static Connection getDBConnection() {

         Connection dbConnection = null;

         try {

                 Class.forName("oracle.jdbc.driver.OracleDriver");

         } catch (ClassNotFoundException e) {

                 System.out.println(e.getMessage());
        }

         try {

                 dbConnection = DriverManager.getConnection("jdbc:oracle:thin:@telemoyo:1521:proybdev","x0gmandi","x0gmandi18");
                 //jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=telemoyo.ccaf.andes)(PORT=1521))(CONNECT_DATA=(SERVER = DEDICATED)(SERVICE_NAME = proybdev)))
                 //dbConnection = DriverManager.getConnection(jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=telemoyo.ccaf.andes)(PORT=1521))(CONNECT_DATA=(SERVER = DEDICATED)(SERVICE_NAME = proybdev)));
                 
                 return dbConnection;

         } catch (SQLException e) {

                 System.out.println(e.getMessage());

         }

         return dbConnection;

 }

}
