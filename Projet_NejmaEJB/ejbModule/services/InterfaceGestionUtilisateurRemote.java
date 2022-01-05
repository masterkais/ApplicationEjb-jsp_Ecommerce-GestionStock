package services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Local;
import javax.ejb.Remote;

import entityBeans.Commande;
import entityBeans.Facture;
import entityBeans.LigneCommande;
import entityBeans.Message;
import entityBeans.Utilisateur;
@Local
public interface InterfaceGestionUtilisateurRemote {
	Utilisateur getUtilisateurByLoginPassword(String login, String password);
	
	void ajouterUtilisateur(String cin,String login, String password, String nom,
			String prenom, String type,String tel,String adresse,String mail,int valid,Date datenes );
	void addUtilisateur(Utilisateur u);
	ArrayList<Utilisateur> getAllUtilisateurs();
	ArrayList<Utilisateur> getListeInvitation();
	Utilisateur getUtilisateurById(String cin);
	void supprimerUtilisateur(String cin);
     void modifierUtilisateur(String cin,String login, String password, String nom,
			String prenom, String type,String tel,String adresse,String mail,int valid,Date datenes);
void modifierUtilisateur(Utilisateur u);
	void Inscrire(String cin, String login, String password, String nom,
			String prenom, String type, int valide,String tel,String adresse,String mail,Date d);

	void modifierUtilisateur(String cin,int valide);
	Long nbruserActive();
	Long nbruserNonActive();
	List<Facture> nbrClientFidele();
	Long nbrVueParJour();
	Long nbrMessageRecentClient(Utilisateur U);
	Long nbrCommandeActiveClient(Utilisateur U);
	Utilisateur getUtilisateurByGmail(String gmail);

	Long nbrtotalemessage();

	Long nbrtotaleCommande();

	Long nbrtotaleuser();

	Long nbrtotaleFacture();

	Long nbrtotaleCategorie();

	Long nbrtotaleproduit();

	Long nbrCLIENTattente();

	Long nbrCOMMANDEattente();

	Long nbrMSGattente();

	Long nbrCOMMANDEactif();

	Long nbrProdFavorie();

	Double sommeVenteparjour();

	ArrayList<Commande> getMeulleureUtilisateur();

	Double sommeVenteparmois();
	List<Message> getUserMessage(String cin);

	Double sommeVenteparjuin();

	Double sommeVenteparmais();

	Double sommeVenteparAvrirl();

	Double sommeVenteparMars();

	Double sommeVenteparFev();

	Double sommeVenteparJanvier();

	Double st2017();

	Double st2018();

	Double st2019();

	Double st2020();

	Double st2021();

	Double st2016();

	Long cma(String cin);

	Long cca(String cin);

	Long ccna(String cin);

	Long totc(String cin);

	Double summt(String cin);

	Long totm(String cin);

	Double mtJanvier(String cin);

	Double mtFevrier(String cin);

	Double mtMars(String cin);

	Double mtAvril(String cin);

	Double mtMais(String cin);

	Double mtJuin(String cin);

   }
