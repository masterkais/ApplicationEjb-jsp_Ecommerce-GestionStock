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

import entityBeans.Commande;
import entityBeans.CommandeMobile;
import entityBeans.Facture;
import entityBeans.Produit;
import entityBeans.UserMobile;
import entityBeans.Utilisateur;
import services.InterfaceGestionFactureRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ListeFacture
 */
@WebServlet("/ListeFacture")
public class ListeFacture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @EJB
       InterfaceGestionFactureRemote gp;
       @EJB
       InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeFacture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try{
	//HttpSession session=request.getSession(true);
	//Utilisateur u=(Utilisateur)session.getAttribute("user");
	
		String cin=request.getParameter("cin");
		
			
			List<Facture> lp=gp.getFactureByUtilisateur(cin);
		for(Facture f:lp){
			UserMobile um=new UserMobile(f.getUtilisateur());
			Utilisateur u=new Utilisateur(um.getCin(), um.getNom(), um.getPrenom(), um.getTel(), um.getAdresse(), um.getType(), um.getDatens(), um.getLogin(), um.getPassword(), um.getInscrire(), um.getValide());
			CommandeMobile cm=new CommandeMobile(f.getCommande());
			Commande cmd=new Commande();
			cmd.setDate_commande(cm.getDate_commande());
			cmd.setDate_livraison(cm.getDate_livraison());
			cmd.setId(cm.getId());
			cmd.setMtFinal(cm.getMtFinal());
			cmd.setPoint(cm.getPoint());
			cmd.setTransport(cm.getTransport());
			f.setCommande(cmd);
			f.setUtilisateur(u);
			
		}
	System.out.println(lp.size());
		
			Gson gson = new Gson();
		  
			String jsonString = gson.toJson(lp);

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
