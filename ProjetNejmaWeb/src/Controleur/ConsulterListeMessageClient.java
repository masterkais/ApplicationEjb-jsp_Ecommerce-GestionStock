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

import entityBeans.Facture;
import entityBeans.Message;
import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ConsulterListeMessage
 */
@WebServlet("/ConsulterListeMessageClient")
public class ConsulterListeMessageClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	InterfaceGestionMessgaRemote gm;
    @EJB
    InterfaceGestionUtilisateurRemote g;
    @EJB
    InterfaceGestionCommandeRemote gc;
    @EJB
    InterfaceGestionPanierRemote gp;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListeMessageClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//	Context c=new InitialContext();
				//InterfaceGestionUtilisateurRemote g=(InterfaceGestionUtilisateurRemote) c.lookup("GUBean");
				
			
				//Context c=new InitialContext();
				//InterfaceGestionUtilisateurRemote g=(InterfaceGestionUtilisateurRemote) c.lookup("GUBean");
				HttpSession session=request.getSession(true);
				Utilisateur us=(Utilisateur)session.getAttribute("user");
			
				ArrayList<Message> lmm=gm.getMessageClient(us);
				request.setAttribute("listmessage", lmm);
			
			
				int nbrMsgNL=(gm.nbrMSGClientNL(us).intValue());
				request.setAttribute("nbrMsgNL", nbrMsgNL);
				int nbrCammandeA=(gc.nbrCommandeActive(us.getCin()).intValue());
				request.setAttribute("nbrCammandeA", nbrCammandeA);
				
				Panier pan=us.getPanier();
				
				if(pan==null){request.setAttribute("nbrPF", 0);System.out.println("pannier null");}
				else{
					
					List<Produit> pp=pan.getProduits();
			if(pp==null){ System.out.println("ando paanier liste ferga"); request.setAttribute("nbrPF", 0);}
				
			else{ 
				
				System.out.println("ando paanier liste mailyena tayha"+pp.size()); request.setAttribute("nbrPF", pp.size());}
				}
				
			
				

		
				request.getRequestDispatcher("pages/Consultation/ListeMessageClient.jsp").forward(request,response);
				
				
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
