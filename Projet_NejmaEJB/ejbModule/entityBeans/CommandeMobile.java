package entityBeans;

import java.util.Date;

public class CommandeMobile {
	private int id;
	private java.util.Date date_commande;
	private java.util.Date date_livraison;
	private double mtUnitial;
	private double mtFinal;
	private int transport;
	private int point;
	public CommandeMobile() {
		super();
	}
	public CommandeMobile(Commande c) {
		super();
		this.id =c.getId();
		this.date_commande =c.getDate_commande(); 
		this.date_livraison = c.getDate_livraison();
		this.mtUnitial = c.getMtUnitial();
		this.mtFinal = c.getMtFinal();
		this.transport = c.getTransport();
		this.point = c.getPoint();
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

}
