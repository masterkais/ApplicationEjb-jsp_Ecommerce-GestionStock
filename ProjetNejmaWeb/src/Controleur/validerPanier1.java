package Controleur;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionPanierRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ValiderPanier
 */
@WebServlet("/ValiderPanier1")
public class validerPanier1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @EJB
     InterfaceGestionPanierRemote gp;
     @EJB
     InterfaceGestionCommandeRemote gc;
     @EJB
     InterfaceGestionProduitRemote g;
     @EJB 
     InterfaceGestionUtilisateurRemote gu;
     @EJB
     InterfaceGestionMessgaRemote gm;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validerPanier1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String type=request.getParameter("type");
			 System.out.println("type :"+type);
			 String pts=request.getParameter("pts");
			 String tp=request.getParameter("typep");
	         System.out.println("r1 :"+pts);
	         SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
	         String ddd=  df.format(new Date());
	         
		HttpSession session=request.getSession(true);
		Utilisateur ut=(Utilisateur)session.getAttribute("user");
		
			Panier panier=(Panier) session.getAttribute("panier")	;
			if(ut.getValide()==0){
				
				session.setAttribute("notif", "DSL maintenant vous n'avez pas le droit de passer une commande attendez vous quelque minutes pour votre compte sera actif");
				response.sendRedirect("ConsulterListePanier1");
			}
			else{
			double j=panier.getMontant();
			double mm=j*2/100;
			int point=(int) (mm);
			int mypt=ut.getPoint();
			ut.setPoint(point+mypt);
				
		gu.modifierUtilisateur(ut);
		 if(pts.equals("Utiliser mes points") )	{
			if(type.equals("avec transport")){
				System.out.println("avec transport et avec point");
				double mt=panier.getMontant()+30;
				System.out.println("mes point"+ut.getPoint());
				double mtfinal=mt-(ut.getPoint());
				System.out.println("mt final"+mtfinal);
				ut.setPoint(0);
				gu.modifierUtilisateur(ut);
				System.out.println("avec transport et avec point"+ut.getPoint());
				int id=gc.ajouterCommande(new Date(), 0, ut.getCin(),mt,mtfinal,1,1,df.parse(ddd));
				System.out.println("ajouter commande");
				for (int i=0;i<panier.getProduits().size();i++){
					gc.ajouterProduitPourCommande(panier.getProduits().get(i).getId(), id, panier.getProduits().get(i).getQuantite());
					System.out.println("ajouter prod pr commande");
					if(tp.equals("paieyment en ligne")){
						gc.saisirtype(id, 1);
						
					}else if(tp.equals("payment par especes")){
						
						gc.saisirtype(id, 0);	
					}	
					int qt=panier.getProduits().get(i).getQuantite();
					System.out.println("qt dispo"+qt);
				Produit p=g.getProduitById(panier.getProduits().get(i).getId());
				int qtu=p.getQuantite();
				int qtf=qtu-qt;
				System.out.println("qt rest"+qtf);
				g.ModifierQt(panier.getProduits().get(i).getId(), qtf);
				System.out.println("1unitial"+qtu+"2panierqt"+qt+"3rrr"+qtf);
				}
			}else{
				double mtt=panier.getMontant();
				double mtfinall=mtt-(ut.getPoint());
			int id=gc.ajouterCommande(new Date(), 0, ut.getCin(),mtt,mtfinall,0,1,df.parse(ddd));
			ut.setPoint(0);
			gu.modifierUtilisateur(ut);
			for (int i=0;i<panier.getProduits().size();i++){
				gc.ajouterProduitPourCommande(panier.getProduits().get(i).getId(), id, panier.getProduits().get(i).getQuantite());
				if(tp.equals("paieyment en ligne")){
					gc.saisirtype(id, 1);
					
				}else if(tp.equals("payment par especes")){
					
					gc.saisirtype(id, 0);	
				}	
				int qt=panier.getProduits().get(i).getQuantite();
				Produit p=g.getProduitById(panier.getProduits().get(i).getId());
				int qtu=p.getQuantite();
				int qtf=qtu-qt;
				g.ModifierQt(panier.getProduits().get(i).getId(), qtf);}}}
		if(pts.equals("Conserver mes points") ) 	{
					if(type.equals("avec transport")){
						double mt=panier.getMontant()+30;
						int id=gc.ajouterCommande(new Date(), 0, ut.getCin(),mt,mt,1,0,df.parse(ddd));
						for (int i=0;i<panier.getProduits().size();i++){
							gc.ajouterProduitPourCommande(panier.getProduits().get(i).getId(), id, panier.getProduits().get(i).getQuantite());
							if(tp.equals("paieyment en ligne")){
								gc.saisirtype(id, 1);
								
							}else if(tp.equals("payment par especes")){
								
								gc.saisirtype(id, 0);	
							}	
							int qt=panier.getProduits().get(i).getQuantite();
							Produit p=g.getProduitById(panier.getProduits().get(i).getId());
							int qtu=p.getQuantite();
							int qtf=qtu-qt;
							g.ModifierQt(panier.getProduits().get(i).getId(), qtf);
						}
					}else{
					int id=gc.ajouterCommande(new Date(), 0, ut.getCin(),panier.getMontant(),panier.getMontant(),0,0,df.parse(ddd));
					for (int i=0;i<panier.getProduits().size();i++){
						gc.ajouterProduitPourCommande(panier.getProduits().get(i).getId(), id, panier.getProduits().get(i).getQuantite());
						if(tp.equals("paieyment en ligne")){
							gc.saisirtype(id, 1);
							
						}else if(tp.equals("payment par especes")){
							
							gc.saisirtype(id, 0);	
						}	
						int qt=panier.getProduits().get(i).getQuantite();
						Produit p=g.getProduitById(panier.getProduits().get(i).getId());
						int qtu=p.getQuantite();
						int qtf=qtu-qt;
						g.ModifierQt(panier.getProduits().get(i).getId(), qtf);
					}}
					
		}
		if(tp.equals("paieyment en ligne")){
			session.removeAttribute("panier");
			
			session.setAttribute("notif", " Cher client paye votre commande");	
					
			int nbrMsgNL=(gm.nbrMSGClientNL(ut).intValue());
			request.setAttribute("nbrMsgNL", nbrMsgNL);
			int nbrCammandeA=(gc.nbrCommandeActive(ut.getCin()).intValue());
			request.setAttribute("nbrCammandeA", nbrCammandeA);
			response.sendRedirect("ConsulterListeCommandeClient");
			
		}else{
					session.removeAttribute("panier");
					
					session.setAttribute("notif", " Votre commande a etait envoyer avec sucssé ");	
							
					int nbrMsgNL=(gm.nbrMSGClientNL(ut).intValue());
					request.setAttribute("nbrMsgNL", nbrMsgNL);
					int nbrCammandeA=(gc.nbrCommandeActive(ut.getCin()).intValue());
					request.setAttribute("nbrCammandeA", nbrCammandeA);
					response.sendRedirect("ConsulterListeProduitClientRange");}
					
			}	
					
					
					
				}catch(Exception er){
					er.printStackTrace();
				}
	}

}
