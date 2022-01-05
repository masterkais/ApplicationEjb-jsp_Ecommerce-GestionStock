package services;

import java.util.ArrayList;
import java.util.Date;

import javax.ejb.Local;
import javax.ejb.Remote;

import entityBeans.Commande;
import entityBeans.LigneCommande;
import entityBeans.Utilisateur;

@Local
public interface InterfaceGestionCommandeRemote {
	Commande getCommandeById(int id);
    int ajouterCommande(Date d,int valid, String id_utilisateur,double mtU,double mtF,int transport,int point,Date dd) ;
    ArrayList<Commande> getAllCommande();
	void chargerdateliv(int id,Date d);
	void ajouterProduitPourCommande(int idProduit, int idCommande,int qte);
	void supprimerCommande(int id);
	ArrayList<Commande> getC(String id);
	ArrayList<LigneCommande> getAllLigneCommande(int id);
	Long nbr();
	ArrayList<Commande> getCommandeD1j() ;
	ArrayList<Commande> getCommandeD2j() ;
	ArrayList<Commande> getCommandeD3j() ;
	ArrayList<Commande> getCommandeD4j() ;
	ArrayList<Commande> getCommandeNow() ;
	
    ArrayList<Commande> getAllCommandeNonActiver();
	ArrayList<Commande> getAllCommandeActiver();
	ArrayList<Commande> getmycommande(String id);
	void activerCommande(int id, int valide);
	ArrayList<LigneCommande> getLigneCommande(int id);
	Long nbrCommandeActive(String h );
	 Long nbrNouvelleCommande();
	 ArrayList<LigneCommande> getLigneC(int id);
	void saisirtype(int id, int valide);
	

}
