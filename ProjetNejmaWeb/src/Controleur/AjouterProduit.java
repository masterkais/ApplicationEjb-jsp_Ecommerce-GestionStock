package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Categorie;
import entityBeans.Produit;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class AjouterProduit
 */
@WebServlet("/AjouterProduit")
public class AjouterProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionCategorieRemote g;
	@EJB
	 InterfaceGestionProduitRemote gp;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterProduit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try{
	HttpSession session=request.getSession(true);

	
			
			String idc=request.getParameter("catcat");
			String lib=request.getParameter("lib");
			String nom=request.getParameter("nomp");
			String prixstr=request.getParameter("prix");
            String image=request.getParameter("img");
			String qtestr=request.getParameter("qt");
			String description=request.getParameter("Description");
			Categorie cat=g.getGategorieById(Integer.parseInt(idc));
			Produit p=new Produit();
			p.setDescription(description);
			p.setLibelle(lib);;
			p.setNom(nom);;
			p.setPrix(Float.parseFloat(prixstr));
			p.setQuantite(Integer.parseInt(qtestr));
			p.setImage(image);
			p.setCategorie(cat);
			gp.ajouterProduit(p);
			
			session.setAttribute("notif", "Ajouter produit avec succé");
			response.sendRedirect("ConsulterListeProduit");
			
			
			
			
			
		}catch(Exception er){
			er.printStackTrace();
		}
	
	}

}
