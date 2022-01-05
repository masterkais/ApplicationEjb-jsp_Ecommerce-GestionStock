package Controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import entityBeans.Categorie;
import entityBeans.Produit;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class MenuClientPrincipale
 */

@Produces(MediaType.APPLICATION_JSON)
@WebServlet("/MenuClientPrincipale")
public class MenuClientPrincipale extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 @EJB
     InterfaceGestionProduitRemote gp;
     @EJB
     InterfaceGestionCategorieRemote gc; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuClientPrincipale() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
		
			ArrayList<Produit> listP=gp.getAllProduits();
		request.setAttribute("listProduit", listP);
		ArrayList<Categorie> listC=gc.getAllCategorie();
		request.setAttribute("list", listC);
		request.getRequestDispatcher("EcranClient.jsp").forward(request,response);
		
			
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
