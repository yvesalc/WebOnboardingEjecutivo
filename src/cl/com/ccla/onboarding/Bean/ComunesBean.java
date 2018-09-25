package cl.com.ccla.onboarding.Bean;

import cl.com.ccla.onboarding.DAO.ComunesDao;
import cl.com.ccla.onboarding.VO.EstadoCreditoVO;
import cl.com.ccla.onboarding.VO.OfertaVO;
import cl.com.ccla.onboarding.VO.UsuarioVO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComunesBean {
    public ComunesBean() {
        super();
    }

    public static List<OfertaVO> ObtieneOfertasUsr(int idusuario) {
    	
    	List<OfertaVO> lstOfertasVo = new ArrayList<OfertaVO>();
    	
    	try {
			lstOfertasVo = ComunesDao.ConsultarOfertasUsuario(idusuario);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return lstOfertasVo;
		
	}
    
    public static UsuarioVO LoginUsuario(String username, String password) {
    	
    	
    	UsuarioVO user = new UsuarioVO();
    	
    	try {
    		
    		
    		user = ComunesDao.GetUsuario(username, password);
    		
    		
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	return user;
    	
    }
    
    
    public static void GuardarOferta(OfertaVO ofertavo) {
    	
    	
		
	}      
    
    
//    antiguos metodos
    
/*
    public List<EstadoCreditoVO> ConsultarEstadosCredito() {
        EstadoCreditoVO estadoCreditoVO1 =
            new EstadoCreditoVO(1, "firmado por cliente");
        EstadoCreditoVO estadoCreditoVO2 =
            new EstadoCreditoVO(1, "en proceso curse");
        EstadoCreditoVO estadoCreditoVO3 = new EstadoCreditoVO(1, "caducada");
        EstadoCreditoVO estadoCreditoVO4 =
            new EstadoCreditoVO(1, "pendiente firma");
        EstadoCreditoVO estadoCreditoVO5 = new EstadoCreditoVO(1, "cursada");
        EstadoCreditoVO estadoCreditoVO6 = new EstadoCreditoVO(1, "cancelada");
        EstadoCreditoVO estadoCreditoVO7 =
            new EstadoCreditoVO(1, "generando documentacion");
        //meter mas estados


        List<EstadoCreditoVO> lista = new ArrayList<EstadoCreditoVO>();
        lista.add(estadoCreditoVO1);
        lista.add(estadoCreditoVO2);
        lista.add(estadoCreditoVO3);
        lista.add(estadoCreditoVO4);
        lista.add(estadoCreditoVO5);
        lista.add(estadoCreditoVO6);
        lista.add(estadoCreditoVO7);

        return lista;

    }

    public List<UsuariosVO> ConsultarEjecutivo() {

    	//UsuariosVO ejecutivoVO = new UsuariosVO(1, "nombrejecutivo");

        //meter mas ejecutivos
        List<UsuariosVO> lista = new ArrayList<UsuariosVO>();


        return lista;

    }

    public static List<OfertaVO> ObtenerListaOfertas(OfertaVO ofertafiltro) {    	
    	
    	List<OfertaVO> lstOfertasVo = new ArrayList<OfertaVO>();
    	
    	lstOfertasVo.add(ofertafiltro);
    	
//    	try {
//			lstOfertasVo = ComunesDao.ConsultarOfertas(ofertafiltro);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    	
    	//Emulando llamada BD
    	OfertaVO ofertavo1 = new OfertaVO("2","5000-2","037CON11234G","1 de 3","Pendiente","username2","idusuario2","sucursal1",10,10);
    	lstOfertasVo.add(ofertavo1);
    	OfertaVO ofertavo2 = new OfertaVO("3","5000-3","037CON11235T","2 de 7","Caducado","username3","idusuario3","sucursal1",10,10);
    	lstOfertasVo.add(ofertavo2);
    	OfertaVO ofertavo3 = new OfertaVO("4","5000-4","034CON11235R","4 de 5","Generando","username4","idusuario4","sucursal1",10,10);
    	lstOfertasVo.add(ofertavo3);
    	OfertaVO ofertavo4 = new OfertaVO("5","5000-5","039CON3425T","3 de 8","Firmado","username5","idusuario5","sucursal1",10,10);
    	lstOfertasVo.add(ofertavo4);
    	OfertaVO ofertavo5 = new OfertaVO("6","5000-6","044CON3213E","8 de 8","Proceso","username6","idusuario6","sucursal1",10,10);
    	lstOfertasVo.add(ofertavo5);
    	OfertaVO ofertavo6 = new OfertaVO("7","5000-7","043CON6516G","2 de 5","Cursado","username7","idusuario7","sucursal1",10,10);
    	lstOfertasVo.add(ofertavo6);
    	
    	
    	
    	
    	return lstOfertasVo;
    }
 */
}
