package Controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.Commande;
import entityBeans.LigneCommande;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class RedigerFacture
 */
@WebServlet("/RedigerFacture")
public class RedigerFacture extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @EJB 
     InterfaceGestionCommandeRemote  gc;
     @EJB
     InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedigerFacture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String id_c=request.getParameter("id");
					
			
					
					Commande com=gc.getCommandeById(Integer.parseInt(id_c));
					
				
					
				    request.setAttribute("comm", com);
					ArrayList<LigneCommande> lc=gc.getLigneC(Integer.parseInt(id_c));
					request.setAttribute("list", lc);
				    	
				request.getRequestDispatcher("Facture.jsp").forward(request, response);
					
				}catch(Exception er){
					System.out.println("erreur:  "+er.getMessage());
				}}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
