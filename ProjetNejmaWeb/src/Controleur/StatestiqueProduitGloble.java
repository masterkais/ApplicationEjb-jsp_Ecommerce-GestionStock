package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.Categorie;
import entityBeans.Message;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class StatestiqueProduitGloble
 */
@WebServlet("/StatestiqueProduitGloble")
public class StatestiqueProduitGloble extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionCategorieRemote g;
	@EJB
	 InterfaceGestionProduitRemote gp;
      @EJB
      InterfaceGestionUtilisateurRemote gu;
      @EJB
   InterfaceGestionMessgaRemote gm;
      @EJB
      InterfaceGestionCommandeRemote gg;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatestiqueProduitGloble() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		ArrayList<Categorie> li=g.getAllCategorie();
		ArrayList<Produit> lp=gp.getAllProduits();
		request.setAttribute("list", li);
		request.setAttribute("listProduit", lp);
		int nbrC=(g.nbrCategorie().intValue());
		request.setAttribute("nbrC", nbrC);
		int nbrMsgA=(gm.nbrMSGattente().intValue());
		request.setAttribute("nbrMsgA", nbrMsgA);
		int nbrcinscri=(gu.nbruserNonActive().intValue());
		request.setAttribute("nbrClientInscrit", nbrcinscri);
		int nbrcA=(gm.nbrMSGattente().intValue());
		request.setAttribute("nbrMSGattente", nbrcA);
		int nbrci=(gu.nbruserNonActive().intValue());
		request.setAttribute("nbrClientInscrit", nbrci);
		ArrayList<Utilisateur> lm=gu.getListeInvitation();
		request.setAttribute("ListInvitation", lm);
		ArrayList<Message> lmm=gm.getAllmessage();
		request.setAttribute("listmessage", lmm);
		int nbrnc=(gg.nbrNouvelleCommande().intValue());
		request.setAttribute("nbrNC", nbrnc);
		request.getRequestDispatcher("pages/Consultation/StatestiqueProduitGloble.jsp").forward(request, response);
		
		
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
