package Controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarException;

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
 * Servlet implementation class BarChart
 */
@WebServlet("/BarChart")
public class BarChart extends HttpServlet {
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
    public BarChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{
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
		
		
			System.out.println("hhhhh");
			
			ArrayList<Commande> j1=gg.getCommandeD1j();
			request.setAttribute("j1", j1);
			ArrayList<Commande> j2=gg.getCommandeD2j();
			request.setAttribute("j2", j2);
			ArrayList<Commande> j3=gg.getCommandeD3j();
			request.setAttribute("j3", j3);
			ArrayList<Commande> j4=gg.getCommandeD4j();
			request.setAttribute("j4", j4);
			ArrayList<Commande> j0=gg.getCommandeNow();
			request.setAttribute("j0", j0);
			for(int i=0;i<j0.size();i++){ArrayList<Commande> lu=gg.getAllCommande();
			request.setAttribute("listu", lu);
			System.out.println(j0.get(i).getMtFinal());
			
			}
			if(j1.size()>2){
				System.out.println("hhhhhhhhhhhhhhhhhhhhh"+j1.get(2).getMtFinal());	
			}else{System.out.println("kkkkkkkkkkkkkkkk");}
			
			request.getRequestDispatcher("pages/Consultation/BarChart.jsp").forward(request, response);
				
				}catch(JarException er){
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
