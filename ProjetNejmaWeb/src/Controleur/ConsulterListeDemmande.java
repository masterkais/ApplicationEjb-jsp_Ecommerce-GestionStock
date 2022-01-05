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

import entityBeans.Commande;
import entityBeans.Facture;
import entityBeans.Message;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionFactureRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ConsulterListeCommande
 */
@WebServlet("/ConsulterListeDemmande")
public class ConsulterListeDemmande extends HttpServlet {
	private static final long serialVersionUID = 1L;
   @EJB
   InterfaceGestionCommandeRemote gc;
	@EJB
	InterfaceGestionMessgaRemote gm;
   @EJB
   InterfaceGestionUtilisateurRemote g;
   @EJB
   InterfaceGestionFactureRemote gf;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListeDemmande() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{

			//String idc=request.getParameter("idc");
	
			ArrayList<Commande> list=gc.getAllCommande();
		    request.setAttribute("listcom", list);
			
			HttpSession session=request.getSession(true);
			 
			ArrayList<Message> lmm=gm.getAllmessage();
			request.setAttribute("listmessage", lmm);
			ArrayList<Utilisateur> li=g.getAllUtilisateurs();
			request.setAttribute("list", li);
			ArrayList<Utilisateur> lm=g.getListeInvitation();
			request.setAttribute("ListInvitation", lm);
			
			ArrayList<Facture> lff=gf.getAllFactures();
			request.setAttribute("ListFacture", lff);

			
			int nbrMSG=(gm.nbrMSG().intValue());
			request.setAttribute("nbrMSG", nbrMSG);
			int nbrcA=(gm.nbrMSGattente().intValue());
			request.setAttribute("nbrMSGattente", nbrcA);
			int nbrcR=(gm.nbrMSGRepondre().intValue());
			request.setAttribute("nbrMSGrepondu", nbrcR);
			int nbrnc=(gc.nbrNouvelleCommande().intValue());
			request.setAttribute("nbrNC", nbrnc);
			int nbrMsgA=(gm.nbrMSGattente().intValue());
			request.setAttribute("nbrMsgA", nbrMsgA);
			
			int nbrcinscri=(g.nbruserNonActive().intValue());
			request.setAttribute("nbrClientInscrit", nbrcinscri);

			
		
		    //ArrayList<LigneCommande> lc=gU.getL(Integer.parseInt(idc));
			//request.setAttribute("list", lc);
		request.getRequestDispatcher("pages/Consultation/ListeDemmande.jsp").forward(request, response);
			
		}catch(Exception er){
			System.out.println("erreur:  "+er.getMessage());
		}}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
