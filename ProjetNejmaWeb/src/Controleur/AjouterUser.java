package Controleur;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;
import services.InterfaceGestionUtilisateurRemote;
import entityBeans.Categorie;
import entityBeans.Produit;
import entityBeans.Utilisateur;

/**
 * Servlet implementation class AjouterUser
 */
@WebServlet("/AjouterUser")
public class AjouterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		request.getRequestDispatcher("MenuAdmin.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
try{
	HttpSession session=request.getSession(true);

	SimpleDateFormat df=new SimpleDateFormat("mm-dd-yyyy");
	
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");
			String adresse=request.getParameter("adresse");
			String tel=request.getParameter("tel");
			String login=request.getParameter("login");
			String password=request.getParameter("password");
			String type=request.getParameter("type");
			String cin=request.getParameter("cin");
			String date=request.getParameter("daten");
			String mail=request.getParameter("mail");
			Utilisateur u=	new Utilisateur();
			
			u.setAdresse(adresse);
			u.setCin(cin);
			u.setDatens(df.parse(date));
			u.setLogin(login);
			u.setNom(nom);
			u.setPassword(password);
			u.setPrenom(prenom);
			u.setTel(tel);
			u.setType(type);
			u.setMail(mail);
			u.setValide(1);
			u.setInscrire(0);
			g.addUtilisateur(u);
		
			session.setAttribute("notif", "Ajouter Utilisateur avec succé");
			response.sendRedirect("ConsulterListeUtilisateur");
			
			
			
			
			
		}catch(Exception er){
			System.out.println(er.getMessage());
		}
	}

}
