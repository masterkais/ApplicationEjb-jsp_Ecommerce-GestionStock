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
import entityBeans.Produit;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class ModifierProduit
 */
@WebServlet("/ModifierProduit")
public class ModifierProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionCategorieRemote g;
	@EJB
	 InterfaceGestionProduitRemote gp;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProduit() {
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
try{
	HttpSession session=request.getSession(true);	
	String idp=request.getParameter("idpp");

			String idc=request.getParameter("idcateg");
			String lib=request.getParameter("libb");
			String nom=request.getParameter("nompp");
			String prixstr=request.getParameter("prixx");
            String image=request.getParameter("imgg");
			String qtestr=request.getParameter("qtt");
			Categorie cat=g.getGategorieById(Integer.parseInt(idc));
			
		gp.modifierProduit(Integer.parseInt(idp), nom, lib,Integer.parseInt(qtestr),  Double.valueOf(prixstr), cat.getId());
		session.setAttribute("notif", " Ce produit a etait modifer avec succé");
		
			response.sendRedirect("ConsulterListeProduit");
			
			
			
			
			
		}catch(Exception er){
			er.printStackTrace();
		}
	}

}
