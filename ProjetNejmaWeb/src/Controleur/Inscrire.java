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
 * Servlet implementation class Inscrire
 */
@WebServlet("/Inscrire")
public class Inscrire extends HttpServlet {
	private static final long serialVersionUID = 1L;
      @EJB
      InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inscrire() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
					Utilisateur uj=gu.getUtilisateurById(cin);
					if(uj==null || uj.getMail()==mail){
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
					u.setValide(0);
					u.setInscrire(0);
					
					gu.addUtilisateur(u);
				
					session.setAttribute("notif", "Votre inscription a etait traiter  avec succé vous pouvez connecter a votre session mais i faut attendrez quelque munites pour votre compte sera active");
					response.sendRedirect("EcranClient.jsp");
					}
					else {
						session.setAttribute("notif", "Vous avez deja un compte avec la cin : "+uj.getCin());
								
						
					}
					
					
					
					
				}catch(Exception er){
					System.out.println(er.getMessage());
				}
			}
	}


