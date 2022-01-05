package services;

import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;

import entityBeans.Panier;

@Local
public interface InterfaceGestionPanierRemote {
	void ajouterpanier(Panier p);
	void ajouterproduit(String u,int p);
	Panier getPanier(String id);
	Panier getPanier(int id);
	void ajouterProdiutPourPanier(int idp, int idpan);
	void modiiferpanier(Panier p);
	int nbrProduitFavorie(Panier p);
	Panier getPanierbycin(String cin);
}
