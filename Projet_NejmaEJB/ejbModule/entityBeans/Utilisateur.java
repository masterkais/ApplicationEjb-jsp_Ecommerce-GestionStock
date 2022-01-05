package entityBeans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Utilisateur implements Serializable {

	private String cin;
	private String nom;
	private String prenom;
	private String tel;
	private String adresse;
	private String mail;
	private String type;
	private Date datens;
    private String login;
	private String password;
	private int inscrire;
	private int valide;
	private int point;
	private Collection <Commande> commandes;
	   private List <Facture> factures;
	   private Panier panier;
		private Collection <Message> messages =new ArrayList<Message>() ;

	public int getInscrire() {
		return inscrire;
	}
	public void setInscrire(int inscrire) {
		this.inscrire = inscrire;
	}
	public int getValide() {
		return valide;
	}
	public void setValide(int valide) {
		this.valide = valide;
	}
	public Utilisateur(String cin, String nom, String prenom, String tel, String adresse, String type, Date datens,
			String login, String password, int inscrire, int valide) {
		super();
		this.cin = cin;
		this.nom = nom;
		this.prenom = prenom;
		this.tel = tel;
		this.adresse = adresse;
		this.type = type;
		this.datens = datens;
		this.login = login;
		this.password = password;
		this.inscrire = inscrire;
		this.valide = valide;
	}
		
	@OneToMany (mappedBy="utilisateur" , cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	public Collection<Message> getMessages() {
		return messages;
	}
	public void setMessages(Collection<Message> messages) {
		this.messages = messages;
	}
	@JsonIgnore
	@OneToMany (mappedBy="utilisateur" , cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	public List<Facture> getFactures() {
		return factures;
	}
	public void setFactures(List<Facture> factures) {
		this.factures = factures;
	}

	@OneToOne(mappedBy="utilisateur", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	public Panier getPanier() {
		return panier;
	}
	public void setPanier(Panier panier) {
		this.panier = panier;
	}
	
	@OneToMany (mappedBy="utilisateur" ,cascade = {CascadeType.PERSIST, CascadeType.REMOVE},fetch=FetchType.LAZY)
	public Collection <Commande> getCommandes() {
		return commandes;
	}
	public void setCommandes(Collection <Commande> commandes) {
		this.commandes = commandes;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public Utilisateur(String cin) {
		super();
		
	}
	public Utilisateur(String cin, String nom, String prenom, String tel,
			String adresse, String type, String login,Date dt,
			String password) {
		super();
		this.cin = cin;
		this.nom = nom;
		this.prenom = prenom;
		this.tel = tel;
		this.adresse = adresse;
		this.type = type;
		this.datens=dt;
		this.login = login;
		this.password = password;
	
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}





	public Utilisateur() {
		
		super();
	
	}


	@Id
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	

	
	
	
	public Date getDatens() {
		return datens;
	}
	public void setDatens(Date datens) {
		this.datens = datens;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

	
}
