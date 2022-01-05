package WService;

import java.io.IOException;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entityBeans.Message;
import entityBeans.UserMobile;
import entityBeans.Utilisateur;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ServiceEnvoyerMessage
 */
@WebServlet("/ServiceEnvoyerMessage")
public class ServiceEnvoyerMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionMessgaRemote gm;
    @EJB
    InterfaceGestionUtilisateurRemote g; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceEnvoyerMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{System.out.println("111");
			//HttpSession session=request.getSession(true);
			//Utilisateur user=(Utilisateur)session.getAttribute("user");
			String cin=request.getParameter("user");
			Utilisateur user=g.getUtilisateurById(cin);
			System.out.println("alba3ith"+user.getCin());
			//String Emeteur=user.getCin();
			
			String objet=request.getParameter("objet");
			String message=request.getParameter("message");
			
		Utilisateur rc=g.getUtilisateurById("11054307");
		System.out.println("almosta9bel"+rc.getCin());
	
			Message m=new Message();
			System.out.println("m.)");
			m.setAdrRecepteur("adminkoko@lpo");
			m.setDate(new Date());
			m.setMessage(message);
			System.out.println(m.getMessage());
			m.setObjet(objet);
			System.out.println(m.getObjet());
			m.setValide(0);
			System.out.println("jjj :");
			m.setAdrEmeteur(user.getMail());
			System.out.println(m.getAdrEmeteur());
			m.setType("Envoyer");
			m.setEtat("ca");
			System.out.println(m.getType());
			UserMobile um;
		
			 um=new UserMobile(user);
			Utilisateur Recp=new Utilisateur();
			Recp.setAdresse(um.getAdresse());
			Recp.setLogin(um.getLogin());
			Recp.setCin(um.getCin());
			m.setUtilisateur(Recp);
		
			gm.EnvoyerMessage(m);
			System.out.println("terminer");
			response.setContentType("application/json");
			  response.setCharacterEncoding("UTF-8");
			response.getWriter().print(new Gson().toJson(m));
		
		
			}catch(Exception er){
				System.out.println(er.getMessage());
			}	
	}

}
