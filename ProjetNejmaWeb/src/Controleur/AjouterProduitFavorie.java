package Controleur;

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

import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class AjouterProduitFavorie
 */
@WebServlet("/AjouterProduitFavorie")
public class AjouterProduitFavorie extends HttpServlet {
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
    public AjouterProduitFavorie() {
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
			String idp=request.getParameter("idpp");
			String cin=request.getParameter("idu");
			Utilisateur user=gu.getUtilisateurById(cin);
			HttpSession session=request.getSession(true);
			Panier pk=(Panier) session.getAttribute("favorie");
			Panier p=user.getPanier();
	
				if(p!=null){
					System.out.println("ooooo");
					Produit pd=gp.getProduitById(Integer.parseInt(idp));
					List<Produit> ls=p.getProduits();
					System.out.println("ooooo");
					ls.add(pd);
					p.setUtilisateur(user);
					p.setProduits(ls);
					System.out.println("ooooo"+ls.size());
		session.setAttribute("notif", " vous avez ajouté un produit dans le panier :");	
		
		gpan.modiiferpanier(p);
						
				}else if(p==null){
					p=new Panier();
					System.out.println("11111");
			List<Produit> ls=new ArrayList<Produit>();
					Produit pd=gp.getProduitById(Integer.parseInt(idp));
					ls.add(pd);
					p.setProduits(ls);
					p.setUtilisateur(user);
					p.setMontant(0);
					System.out.println("111111");
					gpan.modiiferpanier(p);
					System.out.println("1111"+ls.size());
				
				
					session.setAttribute("notif", " vous avez ajouté un produit dans le panier :");	
					System.out.println("11111");
				}
				
				session.setAttribute("favorie", p);
			response.sendRedirect("ConsulterListeProduitClient");
		}catch(Exception er){
			er.printStackTrace();
		}
	}}

