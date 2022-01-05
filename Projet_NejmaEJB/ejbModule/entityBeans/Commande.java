package entityBeans;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
@Entity
public class Commande implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private java.util.Date date_commande;
	private java.util.Date date;
	private java.util.Date date_livraison;
	private double mtUnitial;
	private double mtFinal;
	private int transport;
	private int point;
	private int typepaaiment;
	public int getTransport() {
		return transport;
	}
	public void setTransport(int transport) {
		this.transport = transport;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	private int valide;
@ManyToOne(fetch=FetchType.EAGER)
@JoinColumn(name="utilisateur_id", referencedColumnName="cin")
private Utilisateur utilisateur;
@OneToMany(mappedBy = "commande",fetch=FetchType.LAZY)
private Collection <LigneCommande> lignecommande;

@OneToOne (mappedBy="commande") 
private Facture facture;	
public int getValide() {
	return valide;
}
public void setValide(int valide) {
	this.valide = valide;
}
public Collection<LigneCommande> getLignecommande() {
	return lignecommande;
}
public void setLignecommande(Collection<LigneCommande> lignecommande) {
	this.lignecommande = lignecommande;
}



public void setLigneCommande(Collection <LigneCommande> produits) {
	this.lignecommande = produits;
}
public Facture getFacture() {
	return facture;
}
public void setFacture(Facture facture) {
	this.facture = facture;
}
public Utilisateur getUtilisateur() {
return utilisateur;
}
public void setUtilisateur(Utilisateur utilisateur) {
this.utilisateur = utilisateur;
}


public Commande() {
super();

//TODO Auto-generated constructor stub
}

public int getId() {
return id;
}
public void setId(int id) {
this.id = id;
}
public java.util.Date getDate_commande() {
	return date_commande;
}
public void setDate_commande(java.util.Date date_commande) {
	this.date_commande = date_commande;
}
public java.util.Date getDate_livraison() {
	return date_livraison;
}
public void setDate_livraison(java.util.Date date_livraison) {
	this.date_livraison = date_livraison;
}
public double getMtUnitial() {
	return mtUnitial;
}
public void setMtUnitial(double mtUnitial) {
	this.mtUnitial = mtUnitial;
}
public double getMtFinal() {
	return mtFinal;
}
public void setMtFinal(double mtFinal) {
	this.mtFinal = mtFinal;
}
public int getTypepaaiment() {
	return typepaaiment;
}
public void setTypepaaiment(int typepaaiment) {
	this.typepaaiment = typepaaiment;
}
public java.util.Date getDate() {
	return date;
}
public void setDate(java.util.Date date) {
	this.date = date;
}





}