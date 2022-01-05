package Controleur;

import java.io.IOException;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Message;
import entityBeans.Utilisateur;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ContacterClient
 */
@WebServlet("/ContacterClient")
public class ContacterClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g;  
	@EJB
	 InterfaceGestionMessgaRemote gm; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContacterClient() {
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
		try{
			
			HttpSession session=request.getSession(true);
			Utilisateur user=(Utilisateur)session.getAttribute("user");
			String Emeteur=request.getParameter(user.getMail());
			String objet=request.getParameter("objet");
			String message=request.getParameter("message");
			String Recepteur=request.getParameter("cin");
			Message m=new Message();
			
			m.setDate(new Date());
			m.setMessage(message);
			m.setObjet(objet);
			m.setValide(0);
			m.setType("Recue");
			m.setUtilisateur(user);
			m.setAdrEmeteur(user.getMail());
			m.setAdrRecepteur(g.getUtilisateurById(Recepteur).getMail());
			m.setEtat("ac");
			gm.EnvoyerMessage(m);
			session.setAttribute("notif", "Felicitation ! votre message a etait envoyer a"+g.getUtilisateurById(Recepteur).getMail());
			response.sendRedirect("ConsulterListeMessage");
			}catch(Exception er){
				System.out.println(er.getMessage());
			}	
		
	}

}
