package Controleur;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Utilisateur;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ModifierUser
 */
@WebServlet("/ModifierProfileClient")
public class ModifierProfileClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProfileClient() {
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
		try{
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
					
					g.modifierUtilisateur(cin, login, password, nom, prenom, type, tel, adresse, mail, 1, df.parse(date));
					
					HttpSession session=request.getSession(true);
					Utilisateur uz=(Utilisateur)session.getAttribute("user");
					uz.setAdresse(adresse);
					uz.setCin(cin);
					uz.setLogin(login);
					uz.setMail(mail);
					uz.setNom(nom);
					uz.setLogin(login);
					uz.setPrenom(prenom);
					uz.setPassword(password);
					uz.setTel(tel);
					session.setAttribute("user", uz);
				    session.setAttribute("notif", "Vous etes Modifier  l'utilisateur:"+cin);
					
					response.sendRedirect("ProfileClient");
					
					
					
					
					
				}catch(Exception er){
					System.out.println(er.getMessage());
				}

		
	}

}
