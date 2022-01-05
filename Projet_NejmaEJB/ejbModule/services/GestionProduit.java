package services;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entityBeans.Categorie;
import entityBeans.Message;
import entityBeans.Produit;

import entityBeans.Utilisateur;
@Stateless(mappedName = "GProduitBean")
public class GestionProduit implements InterfaceGestionProduitRemote {
	@PersistenceContext
	EntityManager em;
	public void AjouterPromotion(int m,Double p){
		
		Produit pp=em.find(Produit.class,m);
			double j=pp.getPrix();
			double mm=j*p/100;
			pp.setPrix(j-mm);
		
	}
	@Override
	public Produit getProduitById(int id) {
		// TODO Auto-generated method stub
		return em.find(Produit.class, id);
	}

	public Produit misajourProd(int id,int quantite) {
		// TODO Auto-generated method stub
	Produit p=	 em.find(Produit.class, id);
		 p.setQuantite(quantite);
		 return  p;
	}
	

	@Override
	public ArrayList<Produit> getAllProduits() {
		// TODO Auto-generated method stub
	return (ArrayList<Produit>)em.createQuery("SELECT p FROM Produit p ORDER BY p.quantite DESC").getResultList();
	}
	public ArrayList<Integer> getallid() {
		// TODO Auto-generated method stub
	return (ArrayList<Integer>)em.createQuery("SELECT p.id FROM Produit p ").getResultList();
	}
	public ArrayList<Object> geta() {
		// TODO Auto-generated method stub
	return (ArrayList<Object>)em.createQuery("SELECT p.id,p.nom FROM Produit p ").getResultList();
	}
	@Override
	public ArrayList<Produit> getAllProduitsPromotion() {
		// TODO Auto-generated method stub
	return (ArrayList<Produit>)em.createQuery("SELECT p FROM Produit p where p.promo='1' ").getResultList();
	}
	@Override
	public void modifierProduit(int id,String nom,String libelle,int quantite,Double prix,int id_c) {
		// TODO Auto-generated method stub
		Produit p=em.find(Produit.class,id);
		Categorie c=em.find(Categorie.class,id_c);
		
		
		p.setLibelle(libelle);
		p.setPrix(prix);
		p.setQuantite(quantite);
		p.setNom(nom);
		p.setCategorie(c);

		em.merge(p);
		
	}

	@Override
	public void supprimerProduit(int id) {
		// TODO Auto-generated method stub
		System.out.println("supprimer"+id);
		 Produit p= em.find(Produit.class, id);
	      em.remove(p);
	      System.out.println("supprimer terminer"+id);
	}

	@Override
	public void supprimerProduitPourCategorie(int id_cat) {
		// TODO Auto-generated method stub
		
			// TODO Auto-generated method stub
			Query query = em.createQuery("DELETE FROM Produit u where u.id='"+id_cat+"'");
			

		
		
		 	
	}

	@Override
	public void ajouterProduitUtilisateur(int idCategorie, int idUser) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void ajouterProduit(Produit p) {
		// TODO Auto-generated method stub
		
		em.persist(p);
		
	}
	@Override
	public Long nbrproduit() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Produit ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}

	public void ModifierQt(int id,int qt){
		Produit p=	 em.find(Produit.class, id);
		 p.setQuantite(qt);
		
	}
	public void etatpromo(int id){
		Produit p=	 em.find(Produit.class, id);
		 p.setPromo(1);;
		 em.merge(p);
		
	}
}
