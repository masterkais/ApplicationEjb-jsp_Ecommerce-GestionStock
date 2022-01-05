package Controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entityBeans.Panier;

/**
 * Servlet implementation class ViderPanier
 */
@WebServlet("/ViderPanier1")
public class ViderPanier1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViderPanier1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(true);
		Panier panier=(Panier) session.getAttribute("panier")	;
		if(panier==null){
			session.setAttribute("notif", " votre panier est deja vide ");	
			response.sendRedirect("ConsulterListePanier");
			
		}else{
		session.removeAttribute("panier");
		session.setAttribute("notif", " Vous avez vider le panier ");	
		response.sendRedirect("ConsulterListePanier1");
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
