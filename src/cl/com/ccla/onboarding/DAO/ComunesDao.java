package cl.com.ccla.onboarding.DAO;

import cl.ccla.utils.ConfigConexion;
import cl.com.ccla.onboarding.VO.EstadoCreditoVO;

import cl.com.ccla.onboarding.VO.OfertaVO;
import cl.com.ccla.onboarding.VO.UsuarioVO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.xml.ws.Response;

import oracle.jdbc.OracleTypes;

public class ComunesDao {
    public ComunesDao() {
        super();
    }
    
	public static List<OfertaVO> ConsultarOfertasUsuario(int idUsuario) throws SQLException {
		OfertaVO ofertasVO1 = new OfertaVO();

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

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
					.prepareCall("{ call ONBOARDING.PKG_ONB_OFERTA_WEB.prc_get_oferta_user (?,?)}");

		} catch (SQLException e) {
		}
		callableStatement.setInt(1, idUsuario);
		callableStatement.registerOutParameter(2, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(2);

		while (rset.next()) {

			ofertasVO1 = new OfertaVO();
			//EstadoCreditoVO estadoCreditoVO = new EstadoCreditoVO();

			ofertasVO1.setFechacreacion(rset.getString(1));
			ofertasVO1.setUsuariocreacion(rset.getString(2));
			ofertasVO1.setFechamodificacion(rset.getString(3));
			ofertasVO1.setUsuariomodifica(rset.getString(4));
			ofertasVO1.setOfertacredito(rset.getString(5));
			ofertasVO1.setIdestadoOferta(Integer.parseInt(rset.getString(6)));
			ofertasVO1.setNombreEstadoOferta(rset.getString(7));
        	ofertasVO1.setIdOferta(rset.getString(8));
			ofertasVO1.setOfertacodigo(rset.getString(9));
			ofertasVO1.setIdusaurio(rset.getString(10));
			ofertasVO1.setRut(rset.getString(11));
			ofertasVO1.setDerivado(rset.getString(12));
			ofertasVO1.setSucursal(rset.getString(13));
			ofertasVO1.setDocFirmado(rset.getString(14));

			// boolean add = listaofertas.add(ofertasVO1);
			listaofertas.add(ofertasVO1);

		}

		return listaofertas;

	}
    
    
    @SuppressWarnings("null")
	public static UsuarioVO GetUsuario(String username, String password) throws SQLException {
    	
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		
		UsuarioVO user = new UsuarioVO();

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

//		String selectTableSQL = "SELECT USE_USERNAME FROM ONBOARDING.ONB_USUARIOS WHERE USE_USERNAME ='" + username + "'";
		
		String selectTableSQL = "SELECT \r\n" + 
				"    u.ROL_ID,\r\n" + 
				"    u.USE_VIGENTE,\r\n" + 
				"    u.USE_SUCURSAL,\r\n" + 
				"    u.USE_USERNAME,\r\n" + 
				"    rol.ROL_DESCRIPCION\r\n" + 
				"FROM onboarding.onb_usuarios u \r\n" + 
				"INNER JOIN ONBOARDING.ONB_ROL rol ON u.ROL_ID = rol.ROL_ID\r\n" + 
				"WHERE \r\n" + 
				"    u.USE_USERNAME ='"+ username +"'";

		try {
			dbConnection = getDBConnection();
			
			stmt = dbConnection.createStatement();

			System.out.println(selectTableSQL);

			// execute select SQL stetement
			rs = stmt.executeQuery(selectTableSQL);
			
			while (rs.next()) {

				//String usuario = rs.getString("USE_USERNAME");
				
				
				user.setRol_descripcion(rs.getString("ROL_DESCRIPCION"));
				user.setRol_id(rs.getString("ROL_ID"));
				user.setUse_sucursal(rs.getString("USE_SUCURSAL"));
				user.setUse_username(rs.getString("USE_USERNAME"));
				user.setUse_vigente(rs.getString("USE_VIGENTE"));				

			}
			

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} finally {

			if (callableStatement != null) {
				callableStatement.close();
			}

			if (dbConnection != null) {
				dbConnection.close();
			}

		}
		return user;
		
		
    	
    }
    
    
    
    
//  Antiguo DAO 	
	
	public List<EstadoCreditoVO> ConsultarEstadosCredito() throws SQLException {

		//EstadoCreditoVO estadoCreditoVO1 = new EstadoCreditoVO(1, "firmado por cliente");

		List<EstadoCreditoVO> lista = new ArrayList<EstadoCreditoVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			// conn=
			// DriverManager.getConnection("jdbc:oracle:thin:@telemoyo:1521:proybdev","x0gmandi","x0gm4nd1");

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

//			estadoCreditoVO1 = new EstadoCreditoVO(rset.getInt(1), rset.getString(2));
//			boolean add = lista.add(estadoCreditoVO1);
//			// lista.add(producto);
//
//			System.out.println(estadoCreditoVO1.getIdEstadoCredito());
//			System.out.println(estadoCreditoVO1.getNombreEstado());
		}

		return lista;

	}

//	public List<UsuarioVO> ConsultarUsuarios() throws SQLException {
//		UsuarioVO usuariosVO1 = new UsuarioVO("firmado por cliente", 1, 1, 1, 1, 1);
//
//		List<UsuarioVO> listausuarios = new ArrayList<UsuarioVO>();
//		// lista.add(estadoCreditoVO1);
//
//		Connection conn = null;
//		ResultSet rs = null;
//		CallableStatement stmt = null;
//
//		Connection dbConnection = null;
//		CallableStatement callableStatement = null;
//
//		try {
//			// Class.forName("oracle.jdbc.driver.OracleDriver");
//			// conn=
//			// DriverManager.getConnection("jdbc:oracle:thin:@telemoyo:1521:proybdev","x0gmandi","x0gm4nd1");
//
//			dbConnection = getDBConnection();
//			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");
//
//		} catch (SQLException e) {
//		}
//
//		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);
//
//		callableStatement.execute();
//
//		ResultSet rset = (ResultSet) callableStatement.getObject(1);
//
//		while (rset.next()) {
//
//			usuariosVO1 = new UsuarioVO(rset.getString(1), rset.getInt(2), rset.getInt(3), rset.getInt(4),
//					rset.getInt(5), rset.getInt(6));
//			boolean add = listausuarios.add(usuariosVO1);
//			// lista.add(producto);
//
//			System.out.println(usuariosVO1.getUsername());
//			System.out.println(usuariosVO1.getIdrol());
//			System.out.println(usuariosVO1.getVigente());
//			System.out.println(usuariosVO1.getSucursal());
//			System.out.println(usuariosVO1.getPagesize());
//			System.out.println(usuariosVO1.getPagenumber());
//
//		}
//
//		return listausuarios;
//
//	}

	public static List<OfertaVO> ConsultarOfertas(OfertaVO ofertaFiltro) throws SQLException {
		// OfertaVO ofertasVO1 = new OfertaVO("firmado por cliente",1,1,1,1,1);

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			// conn=
			// DriverManager.getConnection("jdbc:oracle:thin:@telemoyo:1521:proybdev","x0gmandi","x0gm4nd1");

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}
        
    public List<OfertaVO> GrabarOferta() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}        
        
    public List<OfertaVO> ConsultaEnrolamiento() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}        
    
    public List<OfertaVO> GuardaProductoAfiliado() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}            
    
    public List<OfertaVO> GrabaDocumentos() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}            
     
    public List<OfertaVO> ActualizarOferta() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}            
    
    public List<OfertaVO> ActualizarEstadoOferta() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}        
    
    public List<OfertaVO> GetDocumento() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

	}            
    
    public List<OfertaVO> GrabarEnrolamientoManual() throws SQLException {

		List<OfertaVO> listaofertas = new ArrayList<OfertaVO>();
		// lista.add(estadoCreditoVO1);

		Connection conn = null;
		ResultSet rs = null;
		CallableStatement stmt = null;

		Connection dbConnection = null;
		CallableStatement callableStatement = null;

		try {

			dbConnection = getDBConnection();
			callableStatement = dbConnection.prepareCall("{ call onboarding.PKG_ONB_ESTADOS.PRD_GET_LISTA_ESTADOS(?)}");

		} catch (SQLException e) {
		}

		callableStatement.registerOutParameter(1, OracleTypes.CURSOR);

		callableStatement.execute();

		ResultSet rset = (ResultSet) callableStatement.getObject(1);

		while (rset.next()) {

			// ofertasVO1 = new OfertaVO(rset.getString(1), rset.getInt(2), rset.getInt(3),
			// rset.getInt(4),rset.getInt(5),rset.getInt(6));
			// boolean add = listaofertas.add(ofertasVO1);
			// lista.add(producto);

			// System.out.println (ofertasVO1.getOfecodigo());

		}

		return listaofertas;

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
