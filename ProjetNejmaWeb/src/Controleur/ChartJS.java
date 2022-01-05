package Controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.jar.JarException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entityBeans.Categorie;
import entityBeans.Message;
import entityBeans.Produit;
import entityBeans.Utilisateur;

import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ChartJS
 */
@WebServlet("/ChartJS")
public class ChartJS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
    InterfaceGestionProduitRemote gp;
    @EJB
    InterfaceGestionCategorieRemote gc;
    @EJB
    InterfaceGestionMessgaRemote gm;
    @EJB
    InterfaceGestionUtilisateurRemote gu;
    @EJB
    InterfaceGestionCommandeRemote gg;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartJS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
		
			ArrayList<Produit> lp=gp.getAllProduits();
			
		
			 JSONArray JSONArray = new JSONArray(lp);
			Gson gson = new GsonBuilder().serializeNulls().create();
			System.out.println("hhhhh"+JSONArray);
			String jsonString = gson.toJson(JSONArray);
System.out.println("hhhh11"+jsonString);
			response.setContentType("application/json");
			  response.setCharacterEncoding("UTF-8");
			 
			response.getWriter().println(JSONArray);
			
			
				
				
				}catch(JarException er){
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
