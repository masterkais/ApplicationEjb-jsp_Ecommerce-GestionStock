package entityBeans;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
@Entity
public class Message {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String objet;
	private String message;
	private Date date;
	private String AdrRecepteur;
	private String AdrEmeteur;
	private int valide;
	private String type;
	private String etat;
	@ManyToOne
	@JoinColumn(name="Emeteur", referencedColumnName="cin")
	private Utilisateur utilisateur;
	public Utilisateur getUtilisateur() {
	return utilisateur;
	}
	public void setUtilisateur(Utilisateur utilisateur) {
	this.utilisateur = utilisateur;
	}

	public Message() {
		super();
	}
	public Message(int id, String objet, String message, Date date) {
		super();
		this.id = id;
		this.objet = objet;
		this.message = message;
		this.date = date;
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getObjet() {
		return objet;
	}
	public void setObjet(String objet) {
		this.objet = objet;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message2) {
		this.message = message2;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAdrRecepteur() {
		return AdrRecepteur;
	}
	public void setAdrRecepteur(String adrRecepteur) {
		AdrRecepteur = adrRecepteur;
	}
	public int getValide() {
		return valide;
	}
	public void setValide(int valid) {
		this.valide = valid;
	}
	public String getAdrEmeteur() {
		return AdrEmeteur;
	}
	public void setAdrEmeteur(String adrEmeteur) {
		AdrEmeteur = adrEmeteur;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}


}
