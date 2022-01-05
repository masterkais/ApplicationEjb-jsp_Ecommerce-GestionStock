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
 * Servlet implementation class EnvoyerMessage
 */
@WebServlet("/EnvoyerMessage")
public class EnvoyerMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionMessgaRemote gm;
     @EJB
     InterfaceGestionUtilisateurRemote g;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnvoyerMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub @EJB
	   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		try{
			HttpSession session=request.getSession(true);
			Utilisateur user=(Utilisateur)session.getAttribute("user");
			
			String Emeteur=user.getCin();
			String objet=request.getParameter("objet");
			String message=request.getParameter("message");
			
		
			
			
			Message m=new Message();
			m.setAdrRecepteur("Nejma@gmail.com");
			m.setDate(new Date());
			m.setMessage(message);
			m.setObjet(objet);
			m.setValide(0);
			m.setAdrEmeteur(user.getMail());
			m.setType("Envoyer");
			m.setUtilisateur(user);
			m.setEtat("ca");
			
			gm.EnvoyerMessage(m);
			session.setAttribute("notif", "Felicitation ! vous avez envoyer  message ");
			response.sendRedirect("ConsulterListeMessageClient");
			}catch(Exception er){
				System.out.println(er.getMessage());
			}	
	}

}
