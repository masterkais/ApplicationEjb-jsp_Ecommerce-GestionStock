package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class SupprimerProduit
 */
@WebServlet("/SupprimerProduit")
public class SupprimerProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionProduitRemote g;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String id= request.getParameter("idproddd");
			try{
				System.out.println(id);
				g.supprimerProduit(Integer.parseInt(id));
				HttpSession session=request.getSession(true);
					session.setAttribute("notif", " Produit a etait supprimer avec succ�");
				request.getRequestDispatcher("ConsulterListeProduit").forward(request, response);
				
				
			}catch(Exception e){
				System.out.println("erreur: "+e.getMessage());
			}
	}

}
