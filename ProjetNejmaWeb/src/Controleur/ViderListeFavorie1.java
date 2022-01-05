package Controleur;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ViderListeFavorie
 */
@WebServlet("/ViderListeFavorie1")
public class ViderListeFavorie1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	InterfaceGestionPanierRemote pa;
    @EJB 
    InterfaceGestionMessgaRemote gm;
    @EJB 
    InterfaceGestionPanierRemote gp;
    @EJB 
    InterfaceGestionUtilisateurRemote gu; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViderListeFavorie1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		Panier panier=(Panier) session.getAttribute("favorie")	;
		if(panier==null){
			response.sendRedirect("cc");
		}else{
	panier.setProduits(null);
	System.out.println("setprod");
	gp.modiiferpanier(panier);
	System.out.println("modifer");
	
		response.sendRedirect("cc1");
	}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
