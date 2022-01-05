package Controleur;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Message;
import entityBeans.Utilisateur;
import services.InterfaceGestionCommandeRemote;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ModifierUser
 */
@WebServlet("/ModifierProfile")
public class ModifierProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	 InterfaceGestionUtilisateurRemote g; 
	
	@EJB
	InterfaceGestionMessgaRemote gm;
	@EJB
	InterfaceGestionCommandeRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierProfile() {
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
					System.out.println("debut");
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
					
					System.out.println("fin");
					
				    session.setAttribute("notif", "Vous etes Modifier  l'utilisateur:"+cin);
					
					Utilisateur us=(Utilisateur)session.getAttribute("user");
					ArrayList<Utilisateur> li=g.getAllUtilisateurs();
					request.setAttribute("list", li);
					ArrayList<Utilisateur> lm=g.getListeInvitation();
					request.setAttribute("ListInvitation", lm);
					int nbrc=(g.nbruserActive().intValue());
					request.setAttribute("nbrClientA", nbrc);
					int nbrci=(g.nbruserNonActive().intValue());
					request.setAttribute("nbrClientInscrit", nbrci);
					int nbrnc=(gc.nbrNouvelleCommande().intValue());
					request.setAttribute("nbrNC", nbrnc);
					int nbrMsgA=(gm.nbrMSGattente().intValue());
					request.setAttribute("nbrMsgA", nbrMsgA);
					ArrayList<Message> lmm=gm.getMessageRecente();
					request.setAttribute("listmessage", lmm);
					
					request.getRequestDispatcher("pages/Consultation/MonProfile.jsp").forward(request,response);
					
					
					
					
					
				}catch(Exception er){
					System.out.println(er.getMessage());
				}

		
	}

}
