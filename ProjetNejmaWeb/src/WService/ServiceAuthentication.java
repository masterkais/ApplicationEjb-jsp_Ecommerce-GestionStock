package WService;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entityBeans.UserMobile;
import entityBeans.Utilisateur;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class UtilisateurService
 */
@WebServlet("/ServiceAuthentication")
public class ServiceAuthentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @EJB
       InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceAuthentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cin=request.getParameter("cin");
		Utilisateur u=gu.getUtilisateurById(cin);
		UserMobile um=new UserMobile(u);
		response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		  Gson gson = new GsonBuilder().serializeNulls().create();
			
			String jsonString = gson.toJson(um);
		response.getWriter().print(jsonString);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String login=request.getParameter("login");
		String password=request.getParameter("password");
		
		Utilisateur u=gu.getUtilisateurByLoginPassword(login, password);
		UserMobile um;
		if(u==null){
		um=null;	
		}else{
		 um=new UserMobile(u);
		}
		response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		response.getWriter().print(new Gson().toJson(um));
		
	}

}
