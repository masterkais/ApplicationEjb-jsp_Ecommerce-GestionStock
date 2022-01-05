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
 * Servlet implementation class RepondreMessageAdmin
 */
@WebServlet("/RepondreMessageAdmin")
public class RepondreMessageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @EJB
    InterfaceGestionMessgaRemote gm;
    @EJB
    InterfaceGestionUtilisateurRemote g;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepondreMessageAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			HttpSession session=request.getSession(true);
			Utilisateur user=(Utilisateur)session.getAttribute("user");
			String id=request.getParameter("idmess");
			String Emeteur=user.getCin();
			String objet=request.getParameter("objet");
			String message=request.getParameter("message");
			String Recepteur=request.getParameter("cin");
		System.out.println("id"+id);
			gm.ModiiferEtat01(Integer.parseInt(id));
			System.out.println("m termine");
			Message m=new Message();
			m.setAdrRecepteur(g.getUtilisateurById(Recepteur).getMail());
			m.setDate(new Date());
			m.setMessage(message);
			m.setObjet(objet);
			m.setValide(0);
			m.setAdrEmeteur(user.getMail());
			m.setType("Recue");
			m.setEtat("ac");
			m.setUtilisateur(g.getUtilisateurById(Emeteur));
			gm.EnvoyerMessage(m);
			session.setAttribute("notif", "Felicitation ! vous avez repondre au message du "+(g.getUtilisateurById(Recepteur)).getMail());
			response.sendRedirect("ConsulterListeMessage");
			}catch(Exception er){
				System.out.println(er.getMessage());
			}	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
