package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Categorie;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class AjouterPromotionProduit
 */
@WebServlet("/AjouterPromotionProduit")
public class AjouterPromotionProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionProduitRemote g; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterPromotionProduit() {
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
			String id=request.getParameter("idprod");
			String prom=request.getParameter("prom");

		
			
		g.AjouterPromotion(Integer.parseInt(id), Double.valueOf(prom));
		g.etatpromo(Integer.parseInt(id));
		session.setAttribute("notif", "vous avez affecté une promotion a un produit");
			response.sendRedirect("ConsulterListeProduit");
			
			}catch(Exception er){
				System.out.println(er.getMessage());
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
