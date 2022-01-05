package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.Categorie;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class AjouterCategorie
 */
@WebServlet("/AjouterCategorie")
public class AjouterCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionCategorieRemote g;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterCategorie() {
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
		

		try{	
		String des=request.getParameter("Designiation");
		String nom=request.getParameter("nom");
		System.out.println("des"+des+"nom"+nom);
		Categorie cat=new Categorie();
		cat.setLibelle(des);
		cat.setNom(nom);
		
		
		
	g.ajouterCategorie(cat);
		response.sendRedirect("ConsulterListeCategorie");
		
		}catch(Exception er){
			System.out.println(er.getMessage());
		}
	}

}
