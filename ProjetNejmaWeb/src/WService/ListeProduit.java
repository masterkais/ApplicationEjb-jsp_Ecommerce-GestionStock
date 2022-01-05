package WService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entityBeans.Produit;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class ListeProduit
 */
@WebServlet("/ListeProduit")
public class ListeProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @EJB
      InterfaceGestionProduitRemote gp;
      @EJB
      InterfaceGestionCategorieRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try{
			
			
			List<Produit> lp=gp.getAllProduits();
			List<Produit> lp1=new ArrayList<Produit>();
	for(Produit p:lp){
		System.out.println(p.getImage());
		p.setLignecommande(null);
		p.setCategorie(null);
		lp1.add(p);
	}
		
			Gson gson = new Gson();
		  
			String jsonString = gson.toJson(lp1);

			response.setContentType("application/json");
			
			 
			response.getWriter().write(jsonString);
			
			
				
				
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
