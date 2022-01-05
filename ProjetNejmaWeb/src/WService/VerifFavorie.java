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

import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Test;
import entityBeans.UserMobile;
import entityBeans.Utilisateur;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;
import sun.net.www.content.text.plain;

/**
 * Servlet implementation class VerifFavorie
 */
@WebServlet("/VerifFavorie")
public class VerifFavorie extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @EJB
      InterfaceGestionUtilisateurRemote gu;
      @EJB
      InterfaceGestionProduitRemote gp;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifFavorie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			System.out.println("hhhhhhhh");
	   String idu=request.getParameter("idu");
		String idp=request.getParameter("idp");
		Utilisateur u=gu.getUtilisateurById(idu);
		UserMobile um=new UserMobile(u);
		u.setCommandes(null);
		  u.setFactures(null);
		  u.setMessages(null);
		  
		Panier p=u.getPanier();
		 Test t=new Test();
		
	
		  List<Produit> pd=p.getProduits();
		  List<Produit> po=new ArrayList<Produit>();
		  for(Produit pj:pd){
			  pj.setCategorie(null);
			  pj.setLignecommande(null);
			 
			  po.add(pj);
			 
		  }
		System.out.println(po.size());
		  for(Produit ps :po){
				ps.setCategorie(null);
				ps.setLignecommande(null);
			  if(ps.getId()==Integer.parseInt(idp)){
				
				 // Test t=new Test(true);
				 t.setIsValid(true);
				
					 
			  }
			  else{
				
				t.setIsValid(false);
				 
				
					 
			  }
	
		  }
		
		  Gson gson = new Gson();
		  if(t.isIsValid()==false){
		  String jsonString = gson.toJson(null);

			response.setContentType("application/json");
			
			 
			response.getWriter().write(jsonString);
		  }else if(t.isIsValid()==true){
			  String jsonString = gson.toJson(um);

				response.setContentType("application/json");
				
				 
				response.getWriter().write(jsonString);
		  }
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
