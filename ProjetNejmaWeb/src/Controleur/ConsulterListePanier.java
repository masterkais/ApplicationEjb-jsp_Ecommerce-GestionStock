package Controleur;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;

/**
 * Servlet implementation class ConsulterListePanier
 */
@WebServlet("/ConsulterListePanier")
public class ConsulterListePanier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @EJB 
       InterfaceGestionMessgaRemote gm;
       @EJB 
       InterfaceGestionCommandeRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsulterListePanier() {
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
Panier pan=u.getPanier();
		
		if(pan==null){request.setAttribute("nbrPF", 0);System.out.println("pannier null");}
		else{
			
			List<Produit> pp=pan.getProduits();
	if(pp==null){ System.out.println("ando paanier liste ferga"); request.setAttribute("nbrPF", 0);}
		
	else{ 
		
		System.out.println("ando paanier liste mailyena tayha"+pp.size()); request.setAttribute("nbrPF", pp.size());}
		}
		
	
		
		request.getRequestDispatcher("pages/Consultation/Panier.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
