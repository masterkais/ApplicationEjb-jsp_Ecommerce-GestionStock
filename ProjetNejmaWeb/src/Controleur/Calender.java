package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
 * Servlet implementation class Calender
 */
@WebServlet("/Calender")
public class Calender extends HttpServlet {
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
    public Calender() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			HttpSession session = request.getSession(true);
			Utilisateur user=(Utilisateur)session.getAttribute("user");
			ArrayList<Categorie> li=gc.getAllCategorie();
			request.setAttribute("listcat", li);
			ArrayList<Produit> lp=gp.getAllProduits();
			request.setAttribute("listProduit", lp);
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
				request.getRequestDispatcher("pages/Consultation/Calender.jsp").forward(request,response);
				
				
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
