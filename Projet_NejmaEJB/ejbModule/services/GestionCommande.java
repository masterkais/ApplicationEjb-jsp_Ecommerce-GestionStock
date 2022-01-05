package services;
import java.util.ArrayList;
import java.util.Date;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;



import entityBeans.Commande;
import entityBeans.LigneCommande;
import entityBeans.Produit;

import entityBeans.Utilisateur;
@Stateless(mappedName = "GCommandeBean")
public class GestionCommande implements InterfaceGestionCommandeRemote {
	@PersistenceContext
	EntityManager em;

	@Override
	public Commande getCommandeById(int id) {
		// TODO Auto-generated method stub
		return em.find(Commande.class, id);
	}


	public int ajouterCommande(Date d,int valid, String id_utilisateur,double mtU,double mtF,int transport,int point,Date dd) {
		// TODO Auto-generated method stub
		// créer une entité Utilisateur 
		Commande c=new Commande();
	
		
		
		c.setValide(valid);
		Utilisateur u=em.find(Utilisateur.class, id_utilisateur);
		
	c.setMtFinal(mtF);
	c.setMtUnitial(mtU);
		c.setDate_commande(d);
		c.setUtilisateur(u);
		c.setTransport(transport);
		c.setPoint(point);
		c.setTypepaaiment(0);
		c.setDate(dd);
		
		
		em.persist(c);
		em.flush();
		
		return c.getId();
	}

public void ajouterProduitPourCommande(int idProduit, int idCommande, int qte) {
	
	Produit r= em.find(Produit.class, idProduit);
    Commande u= em.find(Commande.class, idCommande);
    LigneCommande lc=new LigneCommande();
    lc.setCommande(u);
    lc.setProduit(r);
    lc.setQuantite(qte);
    em.persist(lc);
    em.flush();
	
}
public ArrayList<Commande> getC(String id){
	Utilisateur c=em.find(Utilisateur.class, id);
	ArrayList<Commande> cv=new ArrayList<Commande>();
	cv.addAll(c.getCommandes());
return	cv;
}

	
	public ArrayList<Commande> getAllCommandeNonActiver() {
		// TODO Auto-generated method stub
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.valide='0'").getResultList();
		
	}

	
	
	
	public ArrayList<Commande> getmycommande(String id) {
		// TODO Auto-generated method stub
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.utilisateur_id="+id).getResultList();
		
	}

	@Override
	public void supprimerCommande(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Long nbr() {		// TODO Auto-generated method stub
		Query query = em.createQuery("SELECT COUNT(*) FROM Commande e WHERE e.valide='0'");
	 Number nombre = (Number) query.getSingleResult() ;

	 return (Long) nombre;
		
	}


	@Override
	public ArrayList<Commande> getAllCommande() {
		// TODO Auto-generated method stub
		return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u ").getResultList();
	}


	@Override
	public ArrayList<Commande> getAllCommandeActiver() {
		// TODO Auto-generated method stub
		 return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.valide!='0'").getResultList();
	}


	public void chargerdateliv(int id,Date d){
		Commande c=em.find(Commande.class, id);
		c.setDate_livraison(d);
	}


	@Override
	public ArrayList<LigneCommande> getAllLigneCommande(int id) {
		// TODO Auto-generated method stub
		ArrayList<LigneCommande> l=new ArrayList<LigneCommande>();
		Commande c=em.find(Commande.class, id);
		l.addAll(c.getLignecommande());
		return l;
	}

	public void activerCommande(int id, int valide) {
		// TODO Auto-generated method stub
		Commande c=em.find(Commande.class, id);
		c.setValide(valide);
	}
	@Override
	public void saisirtype(int id, int valide) {
		// TODO Auto-generated method stub
		Commande c=em.find(Commande.class, id);
		c.setTypepaaiment(valide);
	}


	@Override
	public ArrayList<LigneCommande> getLigneCommande(int id) {
		Commande c=em.find(Commande.class, id);
		ArrayList<LigneCommande> cv=new ArrayList<LigneCommande>();
		cv.addAll(c.getLignecommande());
	return	cv;
	}
	

	@Override
	public Long nbrCommandeActive(String cin ) {
	
		Query query = em.createQuery("SELECT COUNT(*) FROM Commande u where utilisateur_id='"+cin+"' and  u.valide='2' ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}

	public Long nbrNouvelleCommande() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Commande u where u.valide='0'  ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	public ArrayList<LigneCommande> getLigneC(int id){
		Commande c=em.find(Commande.class, id);
		ArrayList<LigneCommande> cv=new ArrayList<LigneCommande>();
		cv.addAll(c.getLignecommande());
	return	cv;
	}


	@Override
	public ArrayList<Commande> getCommandeD1j() {
		// TODO Auto-generated method stubSELECT * from commande where date_commande=SUBDATE(CURRENT_DATE,1);
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.date=SUBDATE(CURRENT_DATE,1)").getResultList();
		
	}
	@Override
	public ArrayList<Commande> getCommandeD2j() {
		// TODO Auto-generated method stubSELECT * from commande where date_commande=SUBDATE(CURRENT_DATE,1);
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.date=SUBDATE(CURRENT_DATE,2)").getResultList();
		
	}
	@Override
	public ArrayList<Commande> getCommandeD3j() {
		// TODO Auto-generated method stubSELECT * from commande where date_commande=SUBDATE(CURRENT_DATE,1);
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.date=SUBDATE(CURRENT_DATE,3)").getResultList();
		
	}
	@Override
	public ArrayList<Commande> getCommandeD4j() {
		// TODO Auto-generated method stubSELECT * from commande where date_commande=SUBDATE(CURRENT_DATE,1);
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.date=SUBDATE(CURRENT_DATE,4)").getResultList();
		
	}
	@Override
	public ArrayList<Commande> getCommandeNow() {
		// TODO Auto-generated method stubSELECT * from commande where date_commande=SUBDATE(CURRENT_DATE,1);
	return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u where u.date=CURRENT_DATE").getResultList();
		
	}

}
