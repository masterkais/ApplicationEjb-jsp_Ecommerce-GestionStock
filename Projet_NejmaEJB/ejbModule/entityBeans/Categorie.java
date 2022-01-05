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
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonManagedReference;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.google.gson.annotations.Expose;

@Entity
public class Categorie implements Serializable {

private int id;
private String libelle;
private String nom;
private List <Produit> produits;


@OneToMany (mappedBy="categorie", cascade = {CascadeType.PERSIST, CascadeType.REMOVE},fetch=FetchType.EAGER)
public List<Produit> getProduits() {
return produits;
}
public void setProduits(List<Produit> produits) {
this.produits = produits;
}

public String getLibelle() {
	return libelle;
}
public void setLibelle(String libelle) {
	this.libelle = libelle;
}
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
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
public Categorie(int id, String libelle, String nom, List<Produit> produits) {
	super();
	this.id = id;
	this.libelle = libelle;
	this.nom = nom;
	this.produits = produits;
}
public Categorie() {
	super();
}


}