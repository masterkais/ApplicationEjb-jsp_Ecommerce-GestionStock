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
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class AjouterProduitFavorie
 */
@WebServlet("/AjouterFavorie")
public class AjouterFavorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @EJB 
    InterfaceGestionProduitRemote gp; 
    @EJB 
    InterfaceGestionPanierRemote gpan; 
    @EJB 
    InterfaceGestionUtilisateurRemote gu; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterFavorie() {
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
			System.out.println("hhhhh");
			String idp=request.getParameter("idp");
			String cin=request.getParameter("idu");
			System.out.println("hhhhh");
			Utilisateur user=gu.getUtilisateurById(cin);
			user.setCommandes(null);
			user.setFactures(null);
			user.setMessages(null);
			
			
			Panier p=user.getPanier();
			if(p!=null){
			Produit pd=gp.getProduitById(Integer.parseInt(idp));
			List<Produit> ls=p.getProduits();
			List<Produit> lp1=new ArrayList<Produit>();
			for(Produit pp:ls){
				pp.setLignecommande(null);
				pp.setCategorie(null);
				lp1.add(pp);
			}
			lp1.add(pd);
			p.setUtilisateur(user);
			p.setProduits(lp1);
			System.out.println("333"+p.getMontant());
			gpan.modiiferpanier(p);
			p.setProduits(null);
			p.setUtilisateur(null);

		


response.setContentType("application/json");
  response.setCharacterEncoding("UTF-8");
response.getWriter().print(new Gson().toJson("Produit a etait ajouter au favori"));
			}else if(p==null){
				p=new Panier();
				Produit pd=gp.getProduitById(Integer.parseInt(idp));
			
				List<Produit> lp1=new ArrayList<Produit>();
			
				lp1.add(pd);
				p.setUtilisateur(user);
				p.setProduits(lp1);
				System.out.println("333"+p.getMontant());
				gpan.modiiferpanier(p);
				p.setProduits(null);
				p.setUtilisateur(null);

			


	response.setContentType("application/json");
	  response.setCharacterEncoding("UTF-8");
	response.getWriter().print(new Gson().toJson("Produit a etait ajouter au favori"));	
				
			}		
		
		}catch(Exception er){
			er.printStackTrace();
		}
	}}

