package services;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entityBeans.Categorie;
import entityBeans.Produit;


@Stateless(mappedName = "GCategorieBean")
public class GestionCategorie implements InterfaceGestionCategorieRemote {
	@PersistenceContext
	EntityManager em;
	public void AjouterPromotion(int c,Double p){
		System.out.println("hhh");
		ArrayList <Produit>  listeProduit= (ArrayList<Produit>)em.createQuery("SELECT u FROM Produit u where categorie_id='"+c+"'").getResultList();
		System.out.println("2");
		for(int i=0;i<listeProduit.size();i++){
			System.out.println("3");
			double j=((Produit) listeProduit.get(i)).getPrix();
			double m=j*p/100;
			((Produit) listeProduit.get(i)).setPrix(j-m);
		}
	}
	@Override
	public Categorie getGategorieById(int id) {
		// TODO Auto-generated method stub
		return em.find(Categorie.class, id);
	}

	@Override
	public void ajouterCategorie(Categorie c) {
		// TODO Auto-generated method stub
	
		
		// Stocker dans la source de données
		em.persist(c);
		
	}

	@Override
	public void modifierCategorie(int id, String nom, String libelle) {
		// TODO Auto-generated method stub
		Categorie c=new Categorie();
		
		c.setNom(libelle);
		c.setLibelle(libelle);;
		// Stocker dans la source de données
		em.merge(c);
		
	}

	@Override
	public void supprimerCategorie(int id) {
		// TODO Auto-generated method stub
		  Categorie c= em.find(Categorie.class, id);
		     
	      em.remove(c);
		
	}

	@Override
	public ArrayList<Categorie> getAllCategorie() {
		// TODO Auto-generated method stub
		return (ArrayList<Categorie>)em.createQuery("SELECT f FROM Categorie f ").getResultList();
		
	}

	@Override
	public Long nbrCategorie() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Categorie");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}

}
