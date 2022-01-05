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

import entityBeans.Categorie;
import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class HomeClient
 */
@WebServlet("/HomeClient")
public class HomeClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   @EJB
	      InterfaceGestionProduitRemote gp;
	      @EJB
	      InterfaceGestionCategorieRemote gc;
	      @EJB
	      InterfaceGestionMessgaRemote gm;
	      @EJB
	      InterfaceGestionCommandeRemote gcc;
	      @EJB
	      InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{	HttpSession session = request.getSession(true);
		Utilisateur user=(Utilisateur)session.getAttribute("user");
		List<Categorie> li=gc.getAllCategorie();
		request.setAttribute("listcat", li);
		ArrayList<Produit> lp=gp.getAllProduits();
		request.setAttribute("listProduit", lp);
		int nbrMsgNL=(gm.nbrMSGClientNL(user).intValue());
		request.setAttribute("nbrMsgNL", nbrMsgNL);
		int nbrCammandeA=(gcc.nbrCommandeActive(user.getCin()).intValue());
		request.setAttribute("nbrCammandeA", nbrCammandeA);
		
		
		int cma=((gu.cma(user.getCin())).intValue());
		request.setAttribute("cma", cma);
		
		
		int cca=((gu.cca(user.getCin())).intValue());
		request.setAttribute("cca", cca);
		
		
		int ccna=((gu.ccna(user.getCin())).intValue());
		request.setAttribute("ccna", ccna);
		
		int totc=((gu.totc(user.getCin())).intValue());
		request.setAttribute("totc", totc);
		
		int totm=((gu.totc(user.getCin())).intValue());
		request.setAttribute("totm", totm);
		
	
		int smmt=(gu.summt(user.getCin()).intValue());
		request.setAttribute("smmt", smmt);
		
		
		
		
		int rmj=(gu.mtJanvier(user.getCin()).intValue());
		request.setAttribute("rmj", rmj);
		System.out.println("111"+rmj);
		int rmf=(gu.mtFevrier(user.getCin()).intValue());
		request.setAttribute("rmf", rmf);
		System.out.println(rmf);
		int rmm=(gu.mtMars(user.getCin()).intValue());
		request.setAttribute("rmm", rmm);
		System.out.println("2222"+rmm);
		int rma=(gu.mtAvril(user.getCin()).intValue());
		request.setAttribute("rma", rma);
		System.out.println("333"+rma);
		int rmma=(gu.mtMais(user.getCin()).intValue());
		request.setAttribute("rmma",rmma);
		System.out.println(rmma);
		int rmju=(gu.mtJuin(user.getCin()).intValue());
		request.setAttribute("rmju", rmju);
		
		
		
		
		
		Panier pan=user.getPanier();
		
		if(pan==null){request.setAttribute("nbrPF", 0);System.out.println("pannier null");}
		else{
			
			List<Produit> pp=pan.getProduits();
	if(pp==null){ System.out.println("ando paanier liste ferga"); request.setAttribute("nbrPF", 0);}
		
	else{ 
		
		System.out.println("ando paanier liste mailyena tayha"+pp.size()); request.setAttribute("nbrPF", pp.size());}
		}
		
	
		
		request.getRequestDispatcher("pages/Consultation/HomeClient.jsp").forward(request,response);
			
			
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
