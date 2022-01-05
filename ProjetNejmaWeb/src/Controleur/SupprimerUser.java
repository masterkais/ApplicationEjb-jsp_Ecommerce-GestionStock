package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class SupprimerUser
 */
@WebServlet("/SupprimerUser")
public class SupprimerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String cin= request.getParameter("id");
			try{
				HttpSession session=request.getSession(true);
				g.supprimerUtilisateur(cin);
				session.setAttribute("notif", " Utilisateur a etait supprimer avec succé");
				
				request.getRequestDispatcher("ConsulterListeUtilisateur").forward(request, response);
				
				
			}catch(Exception e){
				System.out.println("erreur: "+e.getMessage());
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
