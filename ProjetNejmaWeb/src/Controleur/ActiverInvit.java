package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Utilisateur;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ActiverInvit
 */
@WebServlet("/ActiverInvit")
public class ActiverInvit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActiverInvit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try{

			
			String id=request.getParameter("cinv");
			Utilisateur u=g.getUtilisateurById(id);
			u.setValide(1);
						
						System.out.println("modification termine ...");		
		g.modifierUtilisateur(u);
		HttpSession session=request.getSession(true);
		
	    session.setAttribute("notif", "Vous etes Accepter l'invitation de l'utilisateur:"+u.getNom()+" "+u.getPrenom());
		response.sendRedirect("ConsulterListeUtilisateur");
			
		}catch(Exception er){
			System.out.println("erreur:  "+er.getMessage());
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
