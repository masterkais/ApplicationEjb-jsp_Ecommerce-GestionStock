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
import javax.servlet.http.HttpSession;

import entityBeans.Categorie;
import entityBeans.Produit;
import services.InterfaceGestionCategorieRemote;
import services.InterfaceGestionProduitRemote;

/**
 * Servlet implementation class TestProduits
 */
@WebServlet("/TestProduits")
public class TestProduits extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB 
    InterfaceGestionProduitRemote gp;
    @EJB 
    InterfaceGestionCategorieRemote gc;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestProduits() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				try{	HttpSession session = request.getSession(true);
			
				List<Categorie> li=gc.getAllCategorie();
				request.setAttribute("listcat", li);
				ArrayList<Produit> lp=gp.getAllProduits();
				request.setAttribute("listProduit", lp);
			
					request.getRequestDispatcher("template/prodouits.jsp").forward(request,response);
					
					
					}catch(Exception er){
						System.out.println("erruer   "+er.getMessage());
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
