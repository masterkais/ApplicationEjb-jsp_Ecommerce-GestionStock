package Controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Categorie;
import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ConsulterListeProduitClient
 */
@WebServlet("/ConsulterListeProduitClient")
public class ConsulterListeProduitClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   @EJB
	      InterfaceGestionProduitRemote gp;
	      @EJB
	      InterfaceGestionCategorieRemote gc;
	      @EJB
	      InterfaceGestionMessgaRemote gm;
	      @EJB
	      InterfaceGestionCommandeRemote gcc;
	      @EJB
	      InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListeProduitClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try{	HttpSession session = request.getSession(true);
		Utilisateur user=(Utilisateur)session.getAttribute("user");
		List<Categorie> li=gc.getAllCategorie();
		request.setAttribute("listcat", li);
		ArrayList<Produit> lp=gp.getAllProduits();
		request.setAttribute("listProduit", lp);
		int nbrMsgNL=(gm.nbrMSGClientNL(user).intValue());
		request.setAttribute("nbrMsgNL", nbrMsgNL);
		int nbrCammandeA=(gcc.nbrCommandeActive(user.getCin()).intValue());
		request.setAttribute("nbrCammandeA", nbrCammandeA);
		Panier pan=user.getPanier();
		
		if(pan==null){request.setAttribute("nbrPF", 0);System.out.println("pannier null");}
		else{
			
			List<Produit> pp=pan.getProduits();
	if(pp==null){ System.out.println("ando paanier liste ferga"); request.setAttribute("nbrPF", 0);}
		
	else{ 
		
		System.out.println("ando paanier liste mailyena tayha"+pp.size()); request.setAttribute("nbrPF", pp.size());}
		}
		
	
		
			request.getRequestDispatcher("pages/Consultation/ListeProduitClient.jsp").forward(request,response);
			
			
			}catch(Exception er){
				System.out.println("erruer   "+er.getMessage());
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
