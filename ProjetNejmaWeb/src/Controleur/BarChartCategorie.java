package Controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.Categorie;
import entityBeans.Commande;
import entityBeans.Message;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class BarChartCategorie
 */
@WebServlet("/BarChartCategorie")
public class BarChartCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
    InterfaceGestionProduitRemote gp;
    @EJB
    InterfaceGestionCategorieRemote gc;
    @EJB
    InterfaceGestionMessgaRemote gm;
    @EJB
    InterfaceGestionUtilisateurRemote gu;
    @EJB
    InterfaceGestionCommandeRemote gg;  
  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BarChartCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		int nbrp=(gp.nbrproduit().intValue());
		request.setAttribute("nbrp", nbrp);
		int nbrMsgA=(gm.nbrMSGattente().intValue());
		request.setAttribute("nbrMsgA", nbrMsgA);
		int nbrci=(gu.nbruserNonActive().intValue());
		request.setAttribute("nbrClientInscrit", nbrci);
		ArrayList<Utilisateur> lm=gu.getListeInvitation();
		request.setAttribute("ListInvitation", lm);
		int nbrnc=(gg.nbrNouvelleCommande().intValue());
		request.setAttribute("nbrNC", nbrnc);
		int nbrcA=(gm.nbrMSGattente().intValue());
		request.setAttribute("nbrMSGattente", nbrcA);
		ArrayList<Message> lmm=gm.getAllmessage();
		request.setAttribute("listmessage", lmm);
			
		  List<Categorie> cc=gc.getAllCategorie();
		  
			request.setAttribute("cc", cc);
			for(int j=0;j<cc.size();j++){
			List<Produit>pp=cc.get(j).getProduits();
			Collections.sort(pp, new Comparator<Produit>(){
			    public int compare(Produit s1, Produit s2) {
			        return Integer.valueOf(s1.getQuantite()).compareTo(Integer.valueOf(s2.getQuantite()));
			    }
			    
			});
			System.out.println("d");
			for(int i=0;i<pp.size();i++){
				
			System.out.println("hhh"+pp.get(i).getQuantite());
		
			}	System.out.println("f");}
			request.getRequestDispatcher("pages/Consultation/BarCharCategorie.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
