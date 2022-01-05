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

import entityBeans.Facture;
import entityBeans.Message;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ConsulterListeMessage
 */
@WebServlet("/ConsulterListeMessage")
public class ConsulterListeMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	InterfaceGestionMessgaRemote gm;
    @EJB
    InterfaceGestionUtilisateurRemote g;
    @EJB
	InterfaceGestionCommandeRemote gc;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListeMessage() {
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
			 
				ArrayList<Message> lmm=gm.getAllmessage();
				request.setAttribute("listmessage", lmm);
				ArrayList<Utilisateur> li=g.getAllUtilisateurs();
				request.setAttribute("list", li);
				ArrayList<Utilisateur> lm=g.getListeInvitation();
				request.setAttribute("ListInvitation", lm);
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
				request.getRequestDispatcher("pages/Consultation/ListeMessage.jsp").forward(request,response);
				
				
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
