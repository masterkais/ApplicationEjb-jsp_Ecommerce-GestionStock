package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.Categorie;
import entityBeans.Produit;
import services.InterfaceGestionCategorieRemote;

/**
 * Servlet implementation class AjouterPromotionCategorie
 */
@WebServlet("/AjouterPromotionCategorie")
public class AjouterPromotionCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionCategorieRemote g;    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterPromotionCategorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{	
			String id=request.getParameter("idcat");
			String prom=request.getParameter("prom");
		
		Categorie cat=g.getGategorieById(Integer.parseInt(id));
			
		g.AjouterPromotion(Integer.parseInt(id), Double.valueOf(prom));
			
		
			response.sendRedirect("ConsulterListeCategorie");
			
			}catch(Exception er){
				System.out.println(er.getMessage());
			}
		}
	}


