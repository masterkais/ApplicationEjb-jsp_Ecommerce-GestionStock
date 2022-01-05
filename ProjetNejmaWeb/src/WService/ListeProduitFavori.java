package WService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entityBeans.Commande;
import entityBeans.CommandeMobile;
import entityBeans.Facture;
import entityBeans.Message;
import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.UserMobile;
import entityBeans.Utilisateur;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ListeProduitFavori
 */
@WebServlet("/ListeProduitFavori")
public class ListeProduitFavori extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @EJB
      InterfaceGestionPanierRemote gp;
      @EJB
      InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeProduitFavori() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		 try {		// TODO Auto-generated method stub
	String cin=request.getParameter("cin");
	Utilisateur u=gu.getUtilisateurById(cin);
	Panier pan =new Panier();

	pan=u.getPanier();
	List<Produit> lp= pan.getProduits();
	List<Produit> lp1=new ArrayList<Produit>();
for(Produit p:lp){
p.setLignecommande(null);
p.setCategorie(null);
lp1.add(p);
}
pan.setProduits(lp1);
	

Utilisateur us=pan.getUtilisateur();
Utilisateur u1=new Utilisateur();
us.setCommandes(null);
us.setFactures(null);
us.setPanier(null);
us.setMessages(null);
pan.setUtilisateur(us);
	
	
	System.out.println("hhhhhh"+pan.getId());
	
	
	 Gson gson = new GsonBuilder().serializeNulls().create();
	  
	String jsonString = gson.toJson(pan);
	System.out.println(jsonString);

	response.setContentType("application/json");
	 response.setCharacterEncoding("UTF-8");
	 
	response.getWriter().println(jsonString);
	
	 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
