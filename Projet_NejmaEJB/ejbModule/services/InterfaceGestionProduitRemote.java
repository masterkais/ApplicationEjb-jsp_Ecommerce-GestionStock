package services;

import java.util.ArrayList;

import javax.ejb.Local;
import javax.ejb.Remote;


import entityBeans.Produit;

@Local
public interface InterfaceGestionProduitRemote {
	Produit getProduitById(int id);
	void AjouterPromotion(int m,Double p);
	void ajouterProduit(Produit p);

	ArrayList<Produit> getAllProduits();
	ArrayList<Integer> getallid();
	ArrayList<Produit> getAllProduitsPromotion();
	 ArrayList<Object> geta();
	Produit misajourProd(int id,int quantite);

	void modifierProduit(int id,String nom,String libelle,int quantite,Double prix,int id_c);

	void supprimerProduit(int id);
	void ModifierQt(int id,int qt);
	void supprimerProduitPourCategorie(int idUser);

	void ajouterProduitUtilisateur(int idRole, int idUser);
	Long nbrproduit();
	void etatpromo(int id);
}
