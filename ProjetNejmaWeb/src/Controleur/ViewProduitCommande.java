package Controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entityBeans.LigneCommande;
import services.InterfaceGestionCommandeRemote;

/**
 * Servlet implementation class ViewProduitCommande
 */
@WebServlet("/ViewProduitCommande")
public class ViewProduitCommande extends HttpServlet {
	private static final long serialVersionUID = 1L;
       @EJB
       InterfaceGestionCommandeRemote gc;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProduitCommande() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sid=request.getParameter("id");
		List<LigneCommande> cv=new ArrayList<LigneCommande>();
	
		try {
			
		
			cv.addAll(gc.getAllLigneCommande(Integer.parseInt(sid)));
			request.setAttribute("liste", cv);
	request.getRequestDispatcher("pages/Consultation/ViewProduitCommande.jsp").forward(request, response);
			
		}catch(Exception er){
			System.out.println("erreur:  "+er.getMessage());
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
