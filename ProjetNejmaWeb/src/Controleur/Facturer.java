package Controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.Commande;
import entityBeans.LigneCommande;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionFactureRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class Facturer
 */
@WebServlet("/Facturer")
public class Facturer extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @EJB
     InterfaceGestionCommandeRemote gc;
     @EJB
     InterfaceGestionProduitRemote gp;
     @EJB
     InterfaceGestionUtilisateurRemote gU;
     @EJB
     InterfaceGestionFactureRemote gf;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Facturer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String id=request.getParameter("id");
		
		
		try{

			
		
			
			System.out.println("modification commence ...");
			Commande com=gc.getCommandeById(Integer.parseInt(id));
		gc.chargerdateliv(Integer.parseInt(id), new Date());
		
		gc.activerCommande( Integer.parseInt(id), 2);
		gf.ajouterFacture(new Date(),com.getUtilisateur().getCin(),com.getId(),com.getMtFinal());
		
	
		//System.out.println(qt);
		//System.out.println("modification termine ...");
		
		//Commande cm=gc.getCommandeById(Integer.parseInt(id));
		//String prenom=u.getPrenom();
		
	
	
		
		
		
			
	
		System.out.println("ajouter facture ...");			
			
						
		
		response.sendRedirect("ConsulterListeCommande");
			
		}catch(Exception er){
			System.out.println("erreur:  "+er.getMessage());
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
