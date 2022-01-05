package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Commande;
import services.InterfaceGestionCommandeRemote;

/**
 * Servlet implementation class AccepterCommande
 */
@WebServlet("/RefuserCommande")
public class RefuserCommande extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @EJB
       InterfaceGestionCommandeRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefuserCommande() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String id=request.getParameter("idrc");
		
		
		try{

			
			
			System.out.println("modification commence ...");
			
		
		
		gc.activerCommande( Integer.parseInt(id), 4);
		//String prenom=u.getPrenom();
		HttpSession session=request.getSession(true);
		session.setAttribute("notif", " vous avez rejeté la commande numero :"+gc.getCommandeById(Integer.parseInt(id)).getId());	
						System.out.println("modification termine ...");		
		
		response.sendRedirect("ConsulterListeCommande");
			
		}catch(Exception er){
			System.out.println("erreur:  "+er.getMessage());
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
