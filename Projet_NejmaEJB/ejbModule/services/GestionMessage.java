package services;

import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import entityBeans.Message;
import entityBeans.Produit;
import entityBeans.Utilisateur;
@Stateless(mappedName = "GMessageBean")
public class GestionMessage implements InterfaceGestionMessgaRemote {
	@PersistenceContext
	EntityManager em;
	@Override
	public void EnvoyerMessage(Message m) {
		// TODO Auto-generated method stub
		em.persist(m);
	
	}

	@Override
	public ArrayList<Message> getAllmessage() {
		// TODO Auto-generated method stub
		return (ArrayList<Message>)em.createQuery("SELECT r FROM Message r ").getResultList();
	}
	
	public ArrayList<Message> getMessageClient(Utilisateur u) {
		// TODO Auto-generated method stub
		return (ArrayList<Message>)em.createQuery("SELECT r FROM Message r where r.AdrRecepteur='"+u.getMail()+"' OR r.AdrEmeteur='"+u.getMail()+"'").getResultList();
	}
	@Override
	public void SupprimerMessagePourUser(int id) {
		Message m=em.find(Message.class, id);
		// TODO Auto-generated method stub
		em.remove(m);
	}

	@Override
	public Long nbrMSG() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Message u");
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
	public Long nbrMSGRepondre() {
		Query query = em.createQuery("SELECT COUNT(*) FROM Message u where u.valide='1' OR u.valide='3'  ");
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public Long nbrMSGClientNL(Utilisateur u) {
		Query query = em.createQuery("SELECT COUNT(*) FROM Message r where  r.AdrRecepteur='"+u.getMail()+"' and r.valide='0'" );
		 Number nombre = (Number) query.getSingleResult() ;

		 return (Long) nombre;
	}
	@Override
	public ArrayList<Message> getMessageRecente() {
		// TODO Auto-generated method stub
		return  (ArrayList<Message>)em.createQuery("SELECT r FROM Message r  where r.valide='0' ").getResultList();
	}

	@Override
	public Message getMessageById(int id) {
		// TODO Auto-generated method stub
		return em.find(Message.class, id);
	}

public void ModiiferEtat01(int id){
	Message p=	 em.find(Message.class, id);
	 p.setValide(1);
	 em.merge(p);
	
}
public void ModiiferTypeER(int id){
	Message p=	 em.find(Message.class, id);
	 p.setType("recue");
	 em.merge(p);
	
}
public void ModiiferTypeRE(int id){
	Message p=	 em.find(Message.class, id);
	 p.setType("envoyer");
	 em.merge(p);
	
}
public void ModiiferEtat03(int id){
	Message p=	 em.find(Message.class, id);
	 p.setValide(3);
	 em.merge(p);
	
}
public void Vu(int id){
	Message p=	 em.find(Message.class, id);
	 p.setEtat("Deja vue");
	 em.merge(p);
	
}

}
