package services;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entityBeans.Commande;
import entityBeans.Facture;
import entityBeans.LigneCommande;
import entityBeans.Message;
import entityBeans.Utilisateur;
@Stateless(mappedName = "GUBean")
public class GestionUtilisateur implements InterfaceGestionUtilisateurRemote {
	@PersistenceContext
	EntityManager em;
	@Override
	public Utilisateur getUtilisateurByLoginPassword(String login, String password) {
		// TODO Auto-generated method stub
		Utilisateur u =null;
		List<Utilisateur> users =em.createQuery("SELECT u FROM Utilisateur u WHERE  u.login ='"+login+"' and  u.password ='"+password+"'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 u = (Utilisateur) iter.next();					
		}
		
		
		return u;
		
		
	}

	@Override
	public void ajouterUtilisateur(String cin, String login, String password, String nom, String prenom, String type,
			String tel, String adresse,String mail, int valid, Date datenes) {
		// TODO Auto-generated method stub
		Utilisateur u = new Utilisateur();
		u.setCin(cin);
		u.setLogin(login);
		u.setPassword(password);
		u.setNom(nom);
		u.setPrenom(prenom);
		u.setType(type);
		u.setTel(tel);
		u.setAdresse(adresse);
		u.setMail(mail);
		u.setValide(valid);
		u.setDatens(datenes);
		
		
		// Stocker dans la source de données
		em.persist(u);
		
	}

	@Override
	public void addUtilisateur(Utilisateur u) {
		// TODO Auto-generated method stub
		em.persist(u);
		
	}

	@Override
	public ArrayList<Utilisateur> getAllUtilisateurs() {
		// TODO Auto-generated method stub
		return (ArrayList<Utilisateur>)em.createQuery("SELECT u FROM Utilisateur u").getResultList();

	}

	@Override
	public ArrayList<Utilisateur> getListeInvitation() {
		// TODO Auto-generated method stub
		return (ArrayList<Utilisateur>)em.createQuery("SELECT u FROM Utilisateur u where u.valide='0' ").getResultList();

	}

	@Override
	public Utilisateur getUtilisateurById(String cin) {
		// TODO Auto-generated method stub
		return em.find(Utilisateur.class, cin);
	}
	@Override
	public void supprimerUtilisateur(String cin) {
		// TODO Auto-generated method stub
		Utilisateur u= em.find(Utilisateur.class, cin);
	      em.remove(u);
		
	}

	@Override
	public void modifierUtilisateur(String cin, String login, String password, String nom, String prenom, String type,
			String tel, String adresse,String mail, int valid, Date datenes) {
		// TODO Auto-generated method stub
		System.out.println("debut");
		Utilisateur u = new Utilisateur();
		u.setCin(cin);
		u.setLogin(login);
		u.setPassword(password);
		u.setNom(nom);
		u.setPrenom(prenom);
		u.setType(type);
		u.setTel(tel);
		u.setAdresse(adresse);
		u.setMail(mail);
		u.setDatens(datenes);
		u.setValide(valid);
		
		
		// Stocker dans la source de données
		em.merge(u);
		System.out.println("fin");
		
	}

	@Override
	public void Inscrire(String cin, String login, String password, String nom, String prenom, String type, int valide,
			String tel, String adresse,String mail, Date d) {
		// TODO Auto-generated method stub
		Utilisateur u = new Utilisateur();
		u.setCin(cin);
		u.setLogin(login);
		u.setPassword(password);
		u.setNom(nom);
		u.setPrenom(prenom);
		u.setType(type);
		u.setValide(valide);
		u.setDatens(d);
		u.setTel(tel);
		u.setAdresse(adresse);
		u.setMail(mail);
		// Stocker dans la source de données
		em.persist(u);
		
	}

	@Override
	public void modifierUtilisateur(String cin, int valide) {
		// TODO Auto-generated method stub
		Utilisateur u=	em.find(Utilisateur.class, cin);
		u.setCin(cin);

		u.setValide(valide);
		em.merge(u);
		
	}

	@Override
	public Long nbruserActive() {
		// TODO Auto-generated method stub
		Query query = em.createQuery("SELECT COUNT(*) FROM Utilisateur u where u.valide='1'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}

	@Override
	public Long nbruserNonActive() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Utilisateur u where u.valide='0'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrtotalemessage() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Message u ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrtotaleCommande() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Commande u ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrtotaleuser() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Utilisateur u ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrtotaleFacture() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Facture u ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrtotaleCategorie() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Categorie u ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrtotaleproduit() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Produit u ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrCLIENTattente() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Utilisateur u where u.valide='0'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrMSGattente() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Message u where u.valide='0'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrCOMMANDEattente() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Commande u where u.valide='0'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrCOMMANDEactif() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Commande u where u.valide='1'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrProdFavorie() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Produit u where u.promo='1'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Double sommeVenteparjour(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where DATE_FORMAT(e.date_livraison,'%d-%m-%Y')=DATE_FORMAT(NOW(),'%d-%m-%Y')");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double sommeVenteparmois(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where DATE_FORMAT(e.date_livraison,'%m')=DATE_FORMAT(NOW(),'%m')");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	
	@Override
	public Double sommeVenteparJanvier(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-01-01' and date_commande<='2017-01-31'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double sommeVenteparFev(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-02-02' and date_commande<='2017-02-28'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double sommeVenteparMars(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-03-01' and date_commande<='2017-03-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double sommeVenteparAvrirl(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-04-01' and date_commande<='2017-04-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double sommeVenteparmais(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-05-01' and date_commande<='2017-05-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double sommeVenteparjuin(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-06-01' and date_commande<='2017-06-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double st2016(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2016-01-01' and date_commande<='2016-12-12'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double st2017(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2017-01-01' and date_commande<='2017-12-12'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double st2018(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2018-01-01' and date_commande<='2018-12-12'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double st2019(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2019-01-01' and date_commande<='2019-12-12'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double st2020(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2020-01-01' and date_commande<='2020-12-12'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double st2021(){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where date_commande>='2021-01-01' and date_commande<='2021-12-12'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	
	@Override
	public Long nbrVueParJour() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifierUtilisateur(Utilisateur u) {
		// TODO Auto-generated method stub
	em.merge(u)	;
	}

	@Override
	public Long nbrMessageRecentClient(Utilisateur u) {
		// TODO Auto-generated method stub
		ArrayList<Message> ms=(ArrayList<Message>) u.getMessages();
		int n=0;
		for(int i=0;i<ms.size();i++){
			if((ms.get(i)).getValide()==0){
				n++;
			}
		}
		return (long) n;
	}

	@Override
	public Long nbrCommandeActiveClient(Utilisateur u) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ArrayList<Commande> getMeulleureUtilisateur() {
		// TODO Auto-generated method stub
		return (ArrayList<Commande>)em.createQuery("SELECT u FROM Commande u ORDER BY u.mtFinal DESC").getResultList();

	}
	public Utilisateur getUtilisateurByGmail(String gmail) {
		// TODO Auto-generated method stub
		Utilisateur u =null;
		List<Utilisateur> users =em.createQuery("SELECT u FROM Utilisateur u WHERE  u.mail ='"+gmail+"'").getResultList();
		for (Iterator iter = users.iterator(); iter.hasNext();) 
		{
			// récupérer l'utilisateur trouvé par son login  et son mot de passe
			 u = (Utilisateur) iter.next();					
		}
		
		return u;
		
		
	}

	@Override
	public List<Facture> nbrClientFidele() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Message> getUserMessage(String cin) {
		// TODO Auto-generated method stub
		Utilisateur u=em.find(Utilisateur.class, cin);
		return em.createQuery("SELECT m from Message m where m.utilisateur='"+cin+"' or m.AdrRecepteur='"+u.getMail()+"'").getResultList();
	}
	
	@Override
	public Long cma(String cin) {
		Query query = em.createQuery("SELECT COUNT(*) FROM 	Message u where u.utilisateur='"+cin+"' and u.valide=0");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long cca(String cin) {
		Query query = em.createQuery("SELECT COUNT(*) FROM 	Commande u where u.utilisateur='"+cin+"' and u.valide=2");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long ccna(String cin) {
		Query query = em.createQuery("SELECT COUNT(*) FROM 	Commande u where u.utilisateur='"+cin+"' and u.valide=0");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long totc(String cin) {
		Query query = em.createQuery("SELECT COUNT(*) FROM 	Commande u where u.utilisateur='"+cin+"'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long totm(String cin) {
		Query query = em.createQuery("SELECT COUNT(*) FROM 	Message u where u.utilisateur='"+cin+"'");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}

	
	public Double summt(String cin){
		Query query = em.createQuery("SELECT SUM(mtFinal) FROM 	Commande u where u.utilisateur='"+cin+"'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	
	
	
	
	@Override
	public Double mtJanvier(String cin){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where e.utilisateur='"+cin+"' and date_commande>='2017-01-01' and date_commande<='2017-01-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}@Override
	public Double mtFevrier(String cin){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where e.utilisateur='"+cin+"' and date_commande>='2017-02-01' and date_commande<='2017-02-28'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	
	
	
	@Override
	public Double mtMars(String cin){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where e.utilisateur='"+cin+"' and date_commande>='2017-03-01' and date_commande<='2017-03-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	
	@Override
	public Double mtAvril(String cin){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where e.utilisateur='"+cin+"' and date_commande>='2017-04-01' and date_commande<='2017-04-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double mtMais(String cin){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where e.utilisateur='"+cin+"' and date_commande>='2017-05-01' and date_commande<='2017-05-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}
	@Override
	public Double mtJuin(String cin){
		Query query = em.createQuery("SELECT SUM(e.mtFinal) from Commande e where e.utilisateur='"+cin+"' and date_commande>='2017-06-01' and date_commande<='2017-06-30'");
		Double s=(double) 0;
		if( query.getSingleResult()==null){s+= 0;} else{
			 s+=(Double) query.getSingleResult() ;
		}
		return (Double)s;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
