package WService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entityBeans.Message;
import entityBeans.Utilisateur;
import services.InterfaceGestionMessgaRemote;
import services.InterfaceGestionUtilisateurRemote;

/**
 * Servlet implementation class ListeMessage
 */
@WebServlet("/ListeMessage")
public class ListeMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @EJB
     InterfaceGestionMessgaRemote gp;
     @EJB
     InterfaceGestionUtilisateurRemote gu;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try {		// TODO Auto-generated method stub
	String cin=request.getParameter("cin");
	
	Collection<Message> ms=gu.getUserMessage(cin);
	System.out.println(ms.size());
for(Message m:ms){
	Utilisateur u=m.getUtilisateur();
	u.setCommandes(null);
	u.setFactures(null);
	u.setPanier(null);
u.setMessages(null);
	m.setUtilisateur(u);
}
	
	 Gson gson = new GsonBuilder().serializeNulls().create();
	  
	String jsonString = gson.toJson(ms);
	System.out.println(jsonString);

	response.setContentType("application/json");
	 response.setCharacterEncoding("UTF-8");
	 
	response.getWriter().println(jsonString);
	
	 } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
}
	
	
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
