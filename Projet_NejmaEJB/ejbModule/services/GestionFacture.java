package services;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entityBeans.Commande;
import entityBeans.Facture;

import entityBeans.Utilisateur;
@Stateless(mappedName = "GFactureBean")
public class GestionFacture implements InterfaceGestionFactureRemote  {
	@PersistenceContext
	EntityManager em;

	@Override
	public Facture getFactureById(int id) {
		// TODO Auto-generated method stub
		return em.find(Facture.class, id);
	}

	@Override
	public Facture getFactureByIdf(int id) {
		// TODO Auto-generated method stub
		Facture u =null;
		List<Utilisateur> users =em.createQuery("SELECT u FROM Facture u WHERE  u.id ='"+id+"'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 u = (Facture) iter.next();					
		}
		
		return u;
	}

	@Override
	public ArrayList<Facture> getFacturClient(String id) {
		// TODO Auto-generated method stub
		return (ArrayList<Facture>)em.createQuery("SELECT f FROM Facture f  where f.utilisateur='"+id+"'").getResultList();
	}
	@Override
	public void ajouterFacture(Date date_fact,String id_utilisateur,int id_commande,double mt) {
		// TODO Auto-generated method stub
		
		Facture f=new Facture();
		Utilisateur u=em.find(Utilisateur.class, id_utilisateur);
		Commande c=em.find(Commande.class, id_commande);
		f.setDate_fact(date_fact);
		f.setCommande(c);
		f.setUtilisateur(u);
		f.setMontant(mt);
		
		// Stocker dans la source de données
		em.persist(f);
		
		
	}

	@Override
	public ArrayList<Facture> getAllFactures() {
		// TODO Auto-generated method stub
	return (ArrayList<Facture>)em.createQuery("SELECT f FROM Facture f ORDER BY f.date_fact").getResultList();
	}

	@Override
	public void modifierFacture(int id,Date date_fact,Date date_livraison,String description,int quantite,double mantant) {
		
	}

	@Override
	public void supprimerFacture(int id) {
		// TODO Auto-generated method stub
		Facture f= em.find(Facture.class, id);
	      em.remove(f);
	}
	@Override
	public ArrayList<Facture> getFactureByUtilisateur(String cin) {
		// TODO Auto-generated method stub
	return (ArrayList<Facture>)em.createQuery("SELECT f FROM Facture f where f.utilisateur='"+cin+"'").getResultList();
	}

	@Override
	public void ajouterFacture(Date date_fact, String id_utilisateur, int id_commande) {
		// TODO Auto-generated method stub
		
	}
	



}
