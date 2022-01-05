<%@page language="java" import="entityBeans.*,java.util.ArrayList,java.util.Iterator" import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  <%
Utilisateur u= (Utilisateur)session.getAttribute("user");
if (u==null)
{
	System.out.println("nulllllll");
	request.getRequestDispatcher("../../EcranClient.jsp").forward(request, response);
}
else
{
	System.out.println("non null");


%>
   
  
    <meta charset="utf-8">
    <title>Facture</title>
    <link rel="stylesheet" href="facture/style.css" media="all" />
  </head>
  <body>
  <%Commande c =(Commande)request.getAttribute("comm");%>
    <header class="clearfix">
  
      
      <div id="logo">
        <img src="facture/logoo.jpg" height="100" width="100" onclick="imprimer()">
        
      </div>
      <div id="company">
        <h2 class="name">Société  Nejma</h2>
        <div>Port sfax numero : 54</div>
        <div>Numero: 74873022</div>
       
      </div>
      
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">Commande  client :<% if(c!=null)out.println(c.getUtilisateur().getCin()); %></div>
          <h2 class="name"><% if(c!=null)out.println(c.getUtilisateur().getNom()+" "+c.getUtilisateur().getPrenom()); %></h2>
          <div class="address">Tunis Sfax</div>
          <div class="email"><a href=""><% if(c!=null)out.println(c.getUtilisateur().getMail()); %></a></div>
        </div>
        <div id="invoice">
          <h1>N° Commande :<%out.print(c.getId()); %></h1>
          
          <div class="date">Date Facture  : <%if(c!=null) out.println(c.getDate_livraison()); %></div>
        </div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="no">#</th>
            <th class="desc">N°Commande</th>
            <th class="unit">Date Commande</th>
           
            <th class="total">Mantant Total</th>
          </tr>
        </thead>
        <tbody>
     <%

		if (c != null) {
				
				
					out.println("<tr>");
					out.println("<td> " +  ""+ "</td>");
					out.println("<td> " +c.getId() + "</td>");
					out.println("<td> " +c.getDate_commande() + "</td>");
			
	
			out.println("<td> " +c.getMtFinal()  + "</td>");
					out.println("</tr>");
				
		}
			
		%>
        </tbody>
        
       <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>

            <th class="qty">Produit</th>
            <th class="qty">QUANTITY</th>
            <th class="total">Prix</th>
           
          </tr>
        </thead>
        <tbody>
     <%

	
				
				
					
				
				

ArrayList<LigneCommande> ligneCommandes =(ArrayList<LigneCommande>)request.getAttribute("list");
			if (ligneCommandes != null) {
				
				for (int i = 0; i < ligneCommandes.size(); i++) 
				{
					
					out.println("<tr>");
					out.println("<td> " + ((LigneCommande) ligneCommandes.get(i)).getProduit().getNom()+ "</td>");
					out.println("<td> " +((LigneCommande) ligneCommandes.get(i)).getQuantite()+ "</td>");
					out.println("<td> " +((LigneCommande) ligneCommandes.get(i)).getProduit().getPrix()+ "</td>");
								out.println("</tr>");
					
					
				}
				
			}
	
	
			
		%>
        </tbody>
         <tfoot>
            <tr>
            <td colspan="2"></td>
            <td colspan="2">Mantant unitiale :<%out.println(c.getMtUnitial()); %>TND</td>
            <td></td>
          </tr>
             <tr>
            <td colspan="2"></td>
            <td colspan="2"><% if(c.getTransport()==1){ %>avec transport : 30TND<% }else{ %> sans transport  <% } %></td>
            <td></td>
          </tr>
          <tr>
           <tr>
            <td colspan="2"></td>
            <td colspan="2"><% if(c.getPoint()==1){ %>Vous avez utiliser vos point d'achat  <% }else{ %> Vous avez conserver vos point d'achat <% } %></td>
            <td></td>
          </tr>
       
         
          <tr>
            <td colspan="2"></td>
            <td colspan="2">Mantant Final : <%out.println(c.getMtFinal()); %>TND</td>
            <td></td>
          </tr>
        </tfoot>
      </table>  
      
      <div id="thanks">merci !</div>
      <div id="notices">
        <div>Signature :</div>
        <div class="notice">
        
        </div>
      
      
      </div>
 
    <footer>
       <div id="logo">
        <img src="facture/logo.jpg" height="100" width="100" onclick="imprimer()">
        
      </div>
      <div id="company">
        <h2 class="name">copyright</h2>
        <div>ISET SFAX</div>
        <div>24811435</div>
       
      </div>
    </footer>
    </main>

    <%} %>
   
    <script type="text/javascript">
    function imprimer(){
        window.print();
           }  </script>
  </body>
</html>