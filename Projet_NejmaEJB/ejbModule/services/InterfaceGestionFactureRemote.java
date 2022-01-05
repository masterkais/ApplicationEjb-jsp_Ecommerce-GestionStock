package services;

import java.util.ArrayList;
import java.util.Date;

import javax.ejb.Local;
import javax.ejb.Remote;

import entityBeans.Facture;
import entityBeans.Produit;
import entityBeans.Utilisateur;

@Local
public interface InterfaceGestionFactureRemote {
	Facture getFactureById(int id);
	void ajouterFacture(Date date_fact,String id_utilisateur,int id_commande);
    void modifierFacture(int id,Date date_fact,Date date_payment,String description,int quantite,double mantant);
    void supprimerFacture(int id);
    ArrayList<Facture> getAllFactures();
	
	ArrayList<Facture> getFactureByUtilisateur(String cin);
	Facture getFactureByIdf(int id);
	ArrayList<Facture> getFacturClient(String id);
	void ajouterFacture(Date date_fact, String id_utilisateur, int id_commande, double mt);

	

}
