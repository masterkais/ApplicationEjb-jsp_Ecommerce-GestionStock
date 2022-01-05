package entityBeans;




import java.util.*;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;



@Entity
public  class Facture  
{	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	    private  int id;
	    private Date date_fact;
	    private int quantite;
	    private  double montant;
		@OneToOne
		@JoinColumn(name="commande_id", referencedColumnName="id") 
		private Commande commande;
		@ManyToOne
		@JoinColumn(name="utilisateur_id", referencedColumnName="cin")
		private Utilisateur utilisateur;
		
		
		public Facture() {
			super();
			
			
		}
			
		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public Date getDate_fact() {
			return date_fact;
		}


		public void setDate_fact(Date date_fact) {
			this.date_fact = date_fact;
		}



	




		public double getMontant() {
			return montant;
		}


		public void setMontant(double montant) {
			this.montant = montant;
		}

		public int getQuantite() {
			return quantite;
		}


		public void setQuantite(int quantite) {
			this.quantite = quantite;
		}
		public Commande getCommande() {
			return commande;
		}
		public void setCommande(Commande commande) {
			this.commande = commande;
		}

	

		public Utilisateur getUtilisateur() {
			return utilisateur;
		}

		public void setUtilisateur(Utilisateur utilisateur) {
			this.utilisateur = utilisateur;
		}

		
	

		
} 


