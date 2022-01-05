package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Panier;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ConsulterListeFavorie
 */
@WebServlet("/ConsulterListeFavorie")
public class ConsulterListeFavorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @EJB 
    InterfaceGestionMessgaRemote gm;
    @EJB 
    InterfaceGestionCommandeRemote gc;
    @EJB 
    InterfaceGestionUtilisateurRemote gu;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListeFavorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		
		Utilisateur u=(Utilisateur)session.getAttribute("user");
		int nbrMsgNL=(gm.nbrMSGClientNL(u).intValue());
		request.setAttribute("nbrMsgNL", nbrMsgNL);
		int nbrCammandeA=(gc.nbrCommandeActive(u.getCin()).intValue());
		request.setAttribute("nbrCammandeA", nbrCammandeA);
		
		Panier pf=(Panier)session.getAttribute("favorie");
		if(pf!=null){
			System.out.println("filoula");
			u.setPanier(null);
		session.setAttribute("favorie", pf);
		}else{
			System.out.println("filthenia");
		Panier p=u.getPanier();
		session.setAttribute("favorie", p);
		}		
		request.getRequestDispatcher("pages/Consultation/ListeProduitFavorie.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
