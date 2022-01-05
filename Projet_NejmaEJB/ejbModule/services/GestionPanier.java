package services;

import java.util.Iterator;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entityBeans.Commande;
import entityBeans.LigneCommande;
import entityBeans.Panier;
import entityBeans.Produit;
import entityBeans.Utilisateur;
@Stateless(mappedName = "GPanier")
public class GestionPanier implements InterfaceGestionPanierRemote {
	@PersistenceContext
	EntityManager em;
	@Override
	public void ajouterpanier(Panier p) {
		// TODO Auto-generated method stub
     	
     
     	em.persist(p);
	    

	}
	@Override
	public void modiiferpanier(Panier p) {
		// TODO Auto-generated method stub
     	
     
     	em.merge(p);

	}

	@Override
public void ajouterProdiutPourPanier(int idp ,int idpan) {
		
		Produit p= em.find(Produit.class, idp);
	    Panier pan= em.find(Panier.class, idpan);
	    pan.getProduits().add(p);

		
	}
	
	public void ajouterproduit(String u, int p) {
		// TODO Auto-generated method stub
		Utilisateur us=em.find(Utilisateur.class, u);
		
		Produit pp=em.find(Produit.class, p);
		
		Panier pana=em.find(Panier.class, us.getPanier().getId());
		pana.getProduits().add(pp);

	}

	@Override
	public Panier getPanier(String cin) {
		// TODO Auto-generated method stub
		Utilisateur us=em.find(Utilisateur.class, cin);
		return us.getPanier();
	}
	@Override
	public Panier getPanierbycin(String cin) {
		// TODO Auto-generated method stub
		Panier u =null;
		List<Panier> users =em.createQuery("SELECT u FROM Panier u WHERE  u.utilisateur ='"+cin+"'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 u = (Panier) iter.next();					
		}
		
		
		return u;
	}

	@Override
	public Panier getPanier(int id) {
		// TODO Auto-generated method stub
		return em.find(Panier.class,id);
	}
	
			@Override
			public 	int nbrProduitFavorie(Panier p) {
				

				 return  p.getProduits().size();
			}
	public void ajouterProduitPourPanier(int idProduit, int idPanier) {
	/*	
		Produit r= em.find(Produit.class, idProduit);
	    Panier u= em.find(Panier.class, idPanier);
	    Panier lc=new LigneCommande();
	    lc.setCommande(u);
	    lc.setProduit(r);
	    lc.setQuantite(qte);
	    em.persist(lc);
	    em.flush();
		*/
	}

}
