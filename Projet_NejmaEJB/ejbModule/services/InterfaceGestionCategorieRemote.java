package services;

import java.util.ArrayList;

import javax.ejb.Local;
import javax.ejb.Remote;

import entityBeans.Categorie;


@Local
public interface InterfaceGestionCategorieRemote {
	Categorie getGategorieById(int id);

	void ajouterCategorie(Categorie e);

	
	
	 void AjouterPromotion(int c,Double p);

	void modifierCategorie(int id,String nom,String libelle);

	void supprimerCategorie(int id);

	ArrayList<Categorie> getAllCategorie();

	Long nbrCategorie();

}
