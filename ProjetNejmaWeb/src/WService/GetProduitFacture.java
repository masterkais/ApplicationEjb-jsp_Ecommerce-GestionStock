package WService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import entityBeans.Commande;
import entityBeans.Facture;
import entityBeans.LigneCommande;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionFactureRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class GetProduitFacture
 */
@WebServlet("/GetProduitFacture")
public class GetProduitFacture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
      @EJB
      InterfaceGestionFactureRemote gf;
      @EJB
      InterfaceGestionCommandeRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProduitFacture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try{
			String idf=request.getParameter("idf");
			Facture f=gf.getFactureByIdf(Integer.parseInt(idf));
			Utilisateur uu=f.getUtilisateur();
			uu.setCommandes(null);
			uu.setFactures(null);
			uu.setMessages(null);
			
			
			f.setUtilisateur(null);
			Commande c=f.getCommande();
			System.out.println(c.getId());
		ArrayList<LigneCommande> lc=gc.getAllLigneCommande(c.getId());
		List<Produit> lpr=new ArrayList<Produit>();
	    System.out.println("kkkk"+lc.size());
	    for(LigneCommande l :lc){
	    	Produit pp=l.getProduit();
	    	pp.setCategorie(null);
	    	pp.setLignecommande(null);
	    	lpr.add(pp);
	    	
	    	
	    }
			f.setCommande(null);

			Gson gson = new Gson();
		  
			String jsonString = gson.toJson(lpr);

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
