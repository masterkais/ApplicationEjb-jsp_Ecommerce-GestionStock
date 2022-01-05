package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class SendRedirect
 */
@WebServlet("/SendRedirect")
public class SendRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  @EJB 
	    InterfaceGestionMessgaRemote gm;
	    @EJB 
	    InterfaceGestionCommandeRemote gc;
	    @EJB 
	    InterfaceGestionUtilisateurRemote gu;  
	    @EJB
	    InterfaceGestionPanierRemote gp;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendRedirect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try{
			
			HttpSession session=request.getSession(true);
			
			Utilisateur u=(Utilisateur)session.getAttribute("user");
			int nbrMsgNL=(gm.nbrMSGClientNL(u).intValue());
			System.out.println("nbr");
			request.setAttribute("nbrMsgNL", nbrMsgNL);
			int nbrCammandeA=(gc.nbrCommandeActive(u.getCin()).intValue());
			System.out.println("nbr");
			request.setAttribute("nbrCammandeA", nbrCammandeA);
			
		session.setAttribute("favorie", null);
			request.getRequestDispatcher("pages/Consultation/ListeProduitFavorie.jsp").forward(request,response);

				
				
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
