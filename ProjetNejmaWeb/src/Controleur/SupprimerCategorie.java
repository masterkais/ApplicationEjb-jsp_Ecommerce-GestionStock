package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.InterfaceGestionCategorieRemote;

/**
 * Servlet implementation class SupprimerCategorie
 */
@WebServlet("/SupprimerCategorie")
public class SupprimerCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionCategorieRemote g;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  String idcat= request.getParameter("idcat");
		  System.out.println(idcat);
			try{
			
				g.supprimerCategorie(Integer.parseInt(idcat));;
				request.getRequestDispatcher("ConsulterListeCategorie").forward(request, response);
				
				
			}catch(Exception e){
				System.out.println("erreur: "+e.getMessage());
			}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
