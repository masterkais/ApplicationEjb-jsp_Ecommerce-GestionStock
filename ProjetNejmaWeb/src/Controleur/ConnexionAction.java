package Controleur;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Utilisateur;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ConnexionAction
 */
@WebServlet("/ConnexionAction")
public class ConnexionAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @EJB
     InterfaceGestionUtilisateurRemote gu;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnexionAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		
		
		//Tableau pour noter les erreurs �ventuelles
		ArrayList erreurs = new ArrayList();

		//r�cup�rer les donn�es de session si elles existent d�j�				
		out.println("Dans la validation de formualire...");
		String login =request.getParameter("login");
		String password =request.getParameter("password");
		
		//Tester les param�tres du formulaires
		if (login==null || login.equals(""))
			erreurs.add("Veuillez remplir le champ login");
		if (password==null || password.equals(""))
			erreurs.add("Veuillez remplir le champ password");
		out.println("Login:"+login);
		out.println("Mot de passe:"+password);
		
		//Gestion des erreurs du formulaire
		if (erreurs.size()!=0)
		{ 
			// en cas d'existence de champs nulls , retourner au formualire en envoyant le 
			// tableau des erreurs comme attribut
			request.setAttribute("erreurs", erreurs);
			request.getRequestDispatcher("MenuClientPrincipale").forward(request, response);
		}
	   //Acc�der � la couche service et invoquer la m�thode � distante "getUtilisateurByLoginPassword"
		else
		{
			try {
				
			
				
				// Invoker la m�thode � distance 
				//beanRemote.ajouterUtilisateur(login, password, "Ben Saleh", "Mohamed","admin");
				//System.out.println("succ�s d'ajout....");
				
				// R�cup�rer l'utilisateur correspondant aux param�tres saisis
				Utilisateur u = gu.getUtilisateurByLoginPassword(login, password);

				// s'il est existant, le placer dans la session
				if (u!=null)
				{
					

			
				session.setAttribute("user", u);
				//passer � la page d'accueil
				if(u.getType().equals("client")){
					response.sendRedirect("HomeClient");
				}
				else{if(u.getType().equals("admin")){
					response.sendRedirect("HomeAdmin");
				}else{
					if(u.getType().equals("secretaire")){
						response.sendRedirect("HomeSecretaire");
					}else{
						response.sendRedirect("HomeMagasinier");
						
					}
				}
				}
				
				}
				else
				{
					//retourner au formulaire avec message d'erreur
					erreurs.add("Veuillez saisir correctement vos param�tres de connexion...");
					request.setAttribute("erreurs", erreurs);
					session.setAttribute("notif", "Veuillez saisir correctement vos param�tres de connexion...");
					response.sendRedirect("MenuClientPrincipale");

				}
				
				
				
				
				
				} catch (Exception e) {
				e.printStackTrace();
				}
			
			
			
			/*
			 * // construire un objet m�tier "Utilisateur" afin d'acc�der
			// � la base de donn�es et v�rifier les param�tres de connexion
			Utilisateur user = new Utilisateur ();
			if (user.estInscript(login, password))
			{
				//cr�er une session et y palcer le javaBean "Utilisateur"
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				//passer � la page d'accueil
				request.getRequestDispatcher("accueil.jsp").forward(request, response);
			}
			 */
			
			
			
			
			
			
			
			
			
		}
	}

	}


