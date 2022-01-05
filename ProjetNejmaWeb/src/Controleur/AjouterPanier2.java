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
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class AjouterPanier
 */
@WebServlet("/AjouterPanier2")
public class AjouterPanier2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @EJB 
      InterfaceGestionProduitRemote gp;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterPanier2() {
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
		// TODO Auto-generated method stub
		try{
			HttpSession session=request.getSession(true);
			String idp=request.getParameter("idp");
			String qte=request.getParameter("qte");
			Produit pdm=gp.getProduitById(Integer.parseInt(idp));
			if(Integer.parseInt(qte)>pdm.getQuantite()){
				session.setAttribute("notif", "DSL maintenant vous ne pouvez pas ajouter ce produit dans le panier avec cet quantité  ");
				response.sendRedirect("ConsulterListeProduitClientRange");
				
				
			}else{
			
			Panier p=(Panier) session.getAttribute("panier");
			if(p!=null){
				Produit pd=gp.getProduitById(Integer.parseInt(idp));
				pd.setQuantite(Integer.parseInt(qte));
                double mt=Integer.parseInt(qte)*pd.getPrix();
				p.setMontant(p.getMontant()+mt);
				p.getProduits().add(pd);
	session.setAttribute("notif", " vous avez ajouté un produit dans le panier :");	
					
			}else{
				p=new Panier();
				p.setUtilisateur(null);
				p.setMontant(0);
				List<Produit> ls=new ArrayList<Produit>();
				Produit pd=gp.getProduitById(Integer.parseInt(idp));
				pd.setQuantite(Integer.parseInt(qte));
                double mt=Integer.parseInt(qte)*pd.getPrix();
				p.setMontant(p.getMontant()+mt);
				ls.add(pd);
				
				p.setProduits(ls);
				
				
			}
			
			System.out.println("size: "+p.getProduits().size());
			session.setAttribute("panier", p);
		
			response.sendRedirect("ConsulterListeProduitClientRange");}
		}catch(Exception er){
			er.printStackTrace();
		}
	}
	}


