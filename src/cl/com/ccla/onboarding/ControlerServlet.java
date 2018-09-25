package cl.com.ccla.onboarding;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cl.com.ccla.onboarding.Bean.ComunesBean;
import cl.com.ccla.onboarding.VO.OfertaVO;
import cl.com.ccla.onboarding.VO.UsuarioVO;
import cl.com.ccla.onboarding.Bean.*;

/**
 * Servlet implementation class ControlerServlet
 */
@WebServlet("/ControlerServlet")
public class ControlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String userName = request.getParameter("userName").trim();
		
		//String oferta = (String)request.getParameter("frmdata");
		
		String action=(String)request.getParameter("action");
		
		//String json = request.getParameter("frmdataJson");
		
		List<OfertaVO> lstOfertasVo = new ArrayList<OfertaVO>();
		OfertaVO ofertavo = new OfertaVO();
		
		if (action != null || action != "") {
			if (action.equals("Create")) 
			{
				
//				String rut = request.getParameter("rut").trim();
//				String ofecodigo = request.getParameter("oferta").trim();
//				String ofecredito = request.getParameter("credito").trim();
//				String idestado = request.getParameter("estado").trim();
//				String ejecutivo = request.getParameter("ejecutivo").trim();
				
				ofertavo.setRut(request.getParameter("rut").trim());
				ofertavo.setOfertacodigo(request.getParameter("oferta").trim());
				ofertavo.setOfertacredito(request.getParameter("credito").trim());
				ofertavo.setIdestadoOferta(Integer.parseInt(request.getParameter("estado").trim()));
				ofertavo.setIdusaurio(request.getParameter("ejecutivo").trim());
												
				HttpSession userSession= request.getSession(true);				
				UsuarioVO usuario = (UsuarioVO)userSession.getAttribute("userSession");
				//Object a = userSession.getAttribute( "userSession" );
				
				ComunesBean.GuardarOferta(ofertavo);
				
				//OfertaVO ofertavo = new OfertaVO(ofecodigo,rut,ofecredito,"firmados",idestado,ejecutivo,"idusuario","sucursal",10,10);
				
//				ofertavo.setOfecodigo(ofecodigo);
//				ofertavo.setRut(rut);
//				ofertavo.setOfecredito(ofecredito);
//				ofertavo.setFirmados("firmados");
//				ofertavo.setIdestado(idestado);
//				ofertavo.setIdusuario(ejecutivo);
				
								
				//lstOfertasVo.add(ofertavo);					
				
			}
			else if (action.equals("Read")) 
			{
				
				int idusuario = Integer.parseInt(request.getParameter("idusuario").trim());				
				lstOfertasVo = ComunesBean.ObtieneOfertasUsr(idusuario);
				
			}
			else if (action.equals("Update")) 
			{				
			}
			else if(action.equals("Delete"))		
			{
			}

		}
		
//		OfertaVO ofertavo = new OfertaVO("1","5000-1","037CON11234G","3 de 7","Pendiente","username1","idusuario1","sucursal1",10,10);
		
		
		
		//lstOfertasVo = ComunesBean.ObtenerListaOfertas(ofertavo);
		

		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		out.print(gson.toJson(lstOfertasVo));
		out.flush();
		out.close();
		
//		
//		
//		response.setContentType("text/plain");
//		response.getWriter().write(action);
	
	}

}
