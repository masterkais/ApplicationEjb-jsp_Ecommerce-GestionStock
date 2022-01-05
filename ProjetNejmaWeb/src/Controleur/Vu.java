package Controleur;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import services.InterfaceGestionMessgaRemote;

/**
 * Servlet implementation class Vu
 */
@WebServlet("/Vu")
public class Vu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	InterfaceGestionMessgaRemote gm;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vu() {
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
			
			String id=request.getParameter("idmv");
			HttpSession session=request.getSession(true);
		
			gm.ModiiferEtat03(Integer.parseInt(id));			
			session.setAttribute("notif", "Vous avez vue ce message ");
			
			response.sendRedirect("ConsulterListeMessage");
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

}