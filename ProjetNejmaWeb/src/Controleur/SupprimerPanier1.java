package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Panier;
import entityBeans.Produit;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class SupprimerPanier
 */
@WebServlet("/SupprimerPanier1")
public class SupprimerPanier1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @EJB
      InterfaceGestionProduitRemote gp;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerPanier1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		Panier panier=(Panier) session.getAttribute("panier")	;
		String id=request.getParameter("id");
		Produit p=gp.getProduitById(Integer.parseInt(id));
		for (int i=0;i<panier.getProduits().size();i++){
			if(panier.getProduits().get(i).getId()==p.getId()){
			panier.getProduits().remove(i);
			session.setAttribute("panier", panier);
			}
		}
		session.setAttribute("notif", " Vous avez supprimer produit de   panier ");	
		response.sendRedirect("ConsulterListePanier1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
