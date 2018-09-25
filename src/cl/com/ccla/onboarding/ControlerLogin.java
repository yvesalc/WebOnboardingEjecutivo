package cl.com.ccla.onboarding;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cl.com.ccla.onboarding.Bean.ComunesBean;
import cl.com.ccla.onboarding.VO.UsuarioVO;

/**
 * Servlet implementation class ControlerLogin
 */
@WebServlet("/ControlerLogin")
public class ControlerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UsuarioVO usuario = new UsuarioVO();
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		
		usuario = ComunesBean.LoginUsuario(username, password);
		
		HttpSession userSession= request.getSession(true);
		userSession.setAttribute("userSession", usuario);
		
//		response.sendRedirect("success.jsp");
		
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		out.print(gson.toJson(usuario));
		out.flush();
		out.close();
		
		
	}


}
