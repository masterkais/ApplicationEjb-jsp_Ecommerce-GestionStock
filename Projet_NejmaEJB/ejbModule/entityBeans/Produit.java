package entityBeans;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonManagedReference;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.google.gson.annotations.Expose;


@Entity
public class Produit implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String image;
	private String nom;
	private  String libelle;
    private int quantite;
	private double prix;
	private int promo;
	private String description;

	@ManyToOne
	@JoinColumn(name="categorie_id", referencedColumnName="id")
	private Categorie categorie;
	 @OneToMany(mappedBy = "produit",fetch=FetchType.LAZY)
	 private List<LigneCommande> lignecommande=new ArrayList<LigneCommande>();

    public Categorie getCategorie() {
		return categorie;
	}




	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}




	public Produit(int id, String image, String nom, String libelle,
			String designation, int quantite, double prix,Categorie cat) {
		super();
		this.id = id;
		this.image = image;
		this.nom = nom;
		this.libelle = libelle;
		this.quantite = quantite;
		this.prix = prix;
		this.categorie=cat;
	
	}


	

public Produit() {
super();
// TODO Auto-generated constructor stub
}
public List<LigneCommande> getLignecommande() {
	return lignecommande;
}

public void setLignecommande(List<LigneCommande> lignecommande) {
	this.lignecommande = lignecommande;
}
public int getId() {
return id;
}
public void setId(int id) {
this.id = id;
}
public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}


public String getLibelle() {
	return libelle;
}

public void setLibelle(String libelle) {
	this.libelle = libelle;
}
public double getPrix() {
	return prix;
}

public void setPrix(double prix) {
	this.prix = prix;
}



public int getQuantite() {
	return quantite;
}

public void setQuantite(int quantite) {
	this.quantite = quantite;
}



public String getImage() {
	return image;
}

public void setImage(String image) {
	this.image = image;
}




public int getPromo() {
	return promo;
}




public void setPromo(int promotion) {
	this.promo = promotion;
}




public String getDescription() {
	return description;
}




public void setDescription(String description) {
	this.description = description;
}
}