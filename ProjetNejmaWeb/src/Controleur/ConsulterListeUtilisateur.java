package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
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
 * Servlet implementation class ConsulterListeUtilisateur
 */
@WebServlet("/ConsulterListeUtilisateur")
public class ConsulterListeUtilisateur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g; 
	@EJB
	InterfaceGestionMessgaRemote gm;
	@EJB
	InterfaceGestionCommandeRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListeUtilisateur() {
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
			ArrayList<Utilisateur> li=g.getAllUtilisateurs();
			request.setAttribute("list", li);
			ArrayList<Utilisateur> lm=g.getListeInvitation();
			request.setAttribute("ListInvitation", lm);
			int nbrc=(g.nbruserActive().intValue());
			request.setAttribute("nbrClientA", nbrc);
			int nbrci=(g.nbruserNonActive().intValue());
			request.setAttribute("nbrClientInscrit", nbrci);
			int nbrnc=(gc.nbrNouvelleCommande().intValue());
			request.setAttribute("nbrNC", nbrnc);
			int nbrMsgA=(gm.nbrMSGattente().intValue());
			request.setAttribute("nbrMsgA", nbrMsgA);
			ArrayList<Message> lmm=gm.getMessageRecente();
			request.setAttribute("listmessage", lmm);
			request.getRequestDispatcher("pages/Consultation/ListeUtilisateur.jsp").forward(request,response);
			
			
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
