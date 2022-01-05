 <%@include file="../../MenuAdminV3.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
	    <script type="text/javascript" src="Theme-DarkAdmin/js/jquery-1.10.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="Theme-DarkAdmin/js/jquery.dataTables.min.css" />

    <script type="text/javascript" src="Theme-DarkAdmin/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="Theme-DarkAdmin/js/jquery.dataTables.min.js"></script>
  
<title>Accueil</title>
</head>
  <div id="wrapper">
          <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">navigateur</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"></a>
            </div>
              <div class="collapse navbar-collapse navbar-ex1-collapse">
                
                 <ul class="nav navbar-nav navbar-right navbar-user">
                

                  
                    
                    <li class="dropdown user-dropdown">
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                            <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="Deconnexion"><i class="fa fa-power-off"></i> Log Out</a></li>

                        </ul>
                    </li>
                     <li class="dropdown user-dropdown">
                        
                        <ul class="dropdown-menu">
                        <li class="dropdown-header"><%out.println(request.getAttribute("")); %>Notification</li>
                           
                             <li><button  class='btn btn-primary pull-right' onclick='Activer()'><span class='glyphicon glyphicon-heart'></span>Accepter les demandes</button></li>
                    <li><button  class='btn btn-primary pull-right' onclick='Supprimer()'><span class='glyphicon glyphicon-heart'></span>blocké les demandes</button></li>
                    
                           
                            <li class="divider"></li>
                            <li><a href="Deconnexion"><i class="glyphicon glyphicon-download-alt"></i> gerer les comptes</a></li>

                        </ul>
                    </li>
                    <li class="divider-vertical"></li>
                   
                </ul>
            </div>
        </nav>

        <div id="page-wrapper">
          <div class="alert alert-dismissable alert-warning">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        je vous remercie pour votre confiance a nos services
                        <br />
                       
                    </div>
                   </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <h1>les produits que vous avez acheté<small></small></h1>
                  
             <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-user"></i> Liste des Produits de la commande N°<%out.print(request.getParameter("id")); %></h3>
                        </div>
                        <div class="panel-body">
                     
            				
              <table  class="table table-bordered table-hover table-striped">
                          <thead>
                          <tr>
                          <th>Designiation</th>
                          <th>Quntité</th>
                           <th>prix</th> 
                          <th>Categorie</th>
                         
                          </tr>
                          </thead>
                          <tbody>
 
<%
ArrayList<LigneCommande> cv =(ArrayList<LigneCommande>)request.getAttribute("liste");
			if (cv != null) {
				
				for (int j = 0; j < cv.size(); j++) 
				{
					
					out.println("<tr>");
					out.println("<td> " + ((LigneCommande) cv.get(j)).getProduit().getNom()+ "</td>");
					out.println("<td> " +((LigneCommande) cv.get(j)).getQuantite()+ "</td>");
					out.println("<td> " +((LigneCommande) cv.get(j)).getProduit().getPrix()+ "</td>");
					out.println("<td> " +((LigneCommande) cv.get(j)).getProduit().getCategorie().getNom()+ "</td>");
								
					out.println("</tr>");
	}
	
}
		
	%>
                         
                     
             </tbody>             
    </table>
</div>
				</div>
  			</div>
		</div>
    </div>
<!-- Modal -->
 
                
      <script type="text/javascript">
      function alrter(){
    	  return confirm("Veilluez Vous ajouter ce Produit");
    	/*  <a class='btn btn-warning' href='../AcheterProduit?id="+data.get(i).getId()+"' onclick='alrter()'><span class='fa fa-pencil'></span>*/
      }
      $(document).ready(function(){
    	    $('#myTable').DataTable();
    	});
      function Ajouter(idc){
    	  $("#idc").val(idc);
    	  $("#myModal").modal();
    	
    	  
      }
 
   

       </script> 
       <script type="text/javascript">   function view(){
      	 // $("#id_p").val(idp);
      	 $('document').ready(function() {$('#myModal3').modal('show');});
      	
      	  
        }  </script>
       

</body>
</html>