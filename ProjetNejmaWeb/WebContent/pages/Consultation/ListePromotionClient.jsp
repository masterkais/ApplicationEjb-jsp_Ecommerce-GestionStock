  <%@include file="../../MenuAdminV3.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>

<body class="hold-transition skin-blue sidebar-mini" ng-app="myApp" >

<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><%=u.getNom()%> <%=u.getPrenom()%></b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="glyphicon glyphicon-heart"></i>
         <span class="label label-danger"><%Panier pf=(Panier)session.getAttribute("favorie"); if(pf!=null && pf.getProduits()!=null ){out.print(pf.getProduits().size());}else{ %><%out.println(request.getAttribute("nbrPF")); }%></span>

            </a>
            <ul class="dropdown-menu">
              <li class="header"></li>
              
              <li class="footer">
               <li class="footer"><button class="btn btn-primary btn-lg btn-block" onclick="location.href = 'ConsulterListeFavorie1';"  ><span class='glyphicon glyphicon-shopping-cart'></span>Consulter liste favorie</span></button></li>
         
              </li>
            </ul>
          </li>
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success"><%out.println(request.getAttribute("nbrMsgNL")); %></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Vous avez <%out.println(request.getAttribute("nbrMsgNL")); %> messages</li>
                  <li>
                <!-- inner menu: contains the actual data -->
           

               
                 
                
              </li>
              <li class="footer"><button type="submit" onclick="location.href = 'ConsulterListeMessageClient';"   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class='glyphicon glyphicon-envelope'></span>Voir tous les messages</span></button>
              <button type="submit" onclick="Envoyer()"  value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class='glyphicon glyphicon-envelope'></span>Envoyer message</span></button>
              </li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning"><%out.println(request.getAttribute("nbrCammandeA")); %></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Vous avez <%out.println(request.getAttribute("nbrCammandeA")); %> commande etait accepter</li>
              <li>
                <!-- inner menu: contains the actual data -->
              
                
              </li>
              
              <li class="footer"> <button type="submit" onclick="location.href = 'ConsulterListeCommandeClient';"   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Consulte mes  commandes </span></button>
        </li>
            </ul>
          </li>
          
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="	glyphicon glyphicon-shopping-cart"></i>
              <span class="label label-danger"><%Panier p=(Panier)session.getAttribute("panier"); if(p!=null && p.getProduits()!=null ){out.print(p.getProduits().size());} %></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Vos Panier contient <%Panier ps=(Panier)session.getAttribute("panier"); if(p!=null && p.getProduits()!=null ){out.print(p.getProduits().size());} %> produits </li>
              
              <li class="footer">
               <li class="footer"><button class="btn btn-primary btn-lg btn-block" onclick="location.href = 'ConsulterListePanier1';"  ><span class='glyphicon glyphicon-shopping-cart'></span>Consulter vos panier</span></button></li>
         
              </li>
            </ul>
          </li>
          <!-- point achat -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="glyphicon glyphicon-star-empty"></i>
              <span class="label label-danger"> <i class="glyphicon glyphicon-heart"></i></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">  Points d'achat </li>
              
              <li class="footer">
               <li class="footer"><button class="btn btn-primary" type="button">
  Vos Points d'achat est <span class="badge"><%out.print(u.getPoint());  %></span>pts
</button></li>
         
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=u.getNom()%> <%=u.getPrenom()%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/c1.png" class="img-circle" alt="User Image">

                <p>
                  <%=u.getNom()%> <%=u.getPrenom()%> est un <%=u.getType()%>  du société NEJMA
                  <small>Member since 2017</small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="Deconnexion" class="btn btn-default btn-flat">Deconnexion</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=u.getNom()%> </p>
          <a href="#"><i class="fa fa-circle text-success"></i> en ligne</a>
        </div>
      </div>
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>tableau de bord</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> home v1</a></li>
            <li><a href="index2.html"><i class="fa fa-circle-o"></i> home v2</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>Offres </span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">2</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> #</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> #</a></li>
          </ul>
        </li>
       
     
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>Menu consultation</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          
            <li><a href=""><i class="fa fa-circle-o"></i> Home</a></li>
            <li><a href="ConsulterListeProduitClient"><i class="fa fa-circle-o"></i> Consulter liste produits</a></li>
             <li><a href="ConsulterListeMessageClient"><i class="fa fa-circle-o"></i> Consulter liste messages</a></li>
            <li><a href="ConsulterListeCommandeClient"><i class="fa fa-circle-o"></i> Consulter liste commandes</a></li>
          
            <li><a href="AjouterUser"><i class="fa fa-circle-o"></i> Consulter liste factures </a></li>
          </ul>
        </li>
  
     
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
      
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#"></a></li>
        <li class="active"></li>
      </ol>
    </section>


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
        

    <div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        
                       <%
                    String tr=(String)session.getAttribute("notif");
                       if(tr!=null){
                   %><span class="glyphicon glyphicon-ok"></span> <%out.print(tr);
                       } else{%>
                    <p>Cher client  Vous etes entrain de consulter liste produit</p>
                 <%}
                       session.removeAttribute("notif");
                       %>
                        <br />  
                  
                   </div>
          <div class="box">
            <div class="box-header">
              <center><h3 class="box-title">Liste des produits</h3></center>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                                 
                        
                       Categorie <select name="cat" id="cat" data-target="2" class="form-control filter">
                       <option value=""> </option>
    <%List<Categorie> lcat=(List<Categorie>)request.getAttribute("listcat");
    		   for (int i=0;i<lcat.size();i++){
    			   
    			   out.println("<option value='"+lcat.get(i).getNom()+"'>"+lcat.get(i).getNom()+"</option>");
    		   }
    		   %>
    
    
    </select>
  <div class="col-md-4">
            Minimum prix:
            <input type="number" id="min" name="min" class="form-control"></br>
      
            Maximum prix:
            <input type="text" id="max" name="max" class="form-control" ></br>
     </div>
              <table id="example1" class="table table-bordered table-hover table-striped">
                <thead>
             <tr>
              <th> </th>
             <th>ID</th>
                  <th class="select-filter">Nom</th>
                  <th class="select-filter">Designation</th>
                  <th>Prix</th>
                  <th>Quantité diponible</th>
                  <th>Image</th>
                  <th class="select-filter">Categorie</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
               <th> </th>
              <th>ID</th>
                  <th>Nom</th>
                  <th>Designation</th>
                  <th>Prix</th>
                  <th>Quantité diponible</th>
                  <th>Image</th>
                  <th>Categorie</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
              ArrayList<Produit> produits =(ArrayList<Produit>)request.getAttribute("listProduit");
  			if (produits != null) {
  				
  				for (int i = 0; i < produits.size(); i++) 
  				{%>
				<tr data-key-1="Value 1" data-key-2="Value 2">
				<%
				   out.println( "<td class='details-control'></td>");
					out.println("<td> "+((Produit) produits.get(i)).getId()+"</td>");
					out.println("<td> " + ((Produit) produits.get(i)).getNom()+ "</td>");
					out.println("<td> " + ((Produit) produits.get(i)).getLibelle()+ "</td>");
					out.println("<td> " + ((Produit) produits.get(i)).getPrix()+ "</td>");
					if(((Produit) produits.get(i)).getQuantite()!=0){
					out.println("<td> " + ((Produit) produits.get(i)).getQuantite()+ "</td>");}
					else{	out.println("<td>pas dispo </td>");}
					out.println("<td><img width='120px' heigth='120px' src='image/"+((Produit) produits.get(i)).getImage()+"'/></td>");
					out.println("<td> " + ((Produit) produits.get(i)).getCategorie().getNom()+" </td>");
					if(((Produit) produits.get(i)).getQuantite()!=0){
					%>
			
					<td> <a  class='btn btn-info btn-sm' data-toggle='modal' onclick="AjouterProduit('<% out.print(((Produit) produits.get(i)).getId());%>','<% out.print(((Produit) produits.get(i)).getNom());%>')"><span class='glyphicon glyphicon-shopping-cart'></span>Ajouter au panier</a>
				 
			 <a  class='btn btn-warning btn-sm' onclick="FavorieProduit('<% out.print(((Produit) produits.get(i)).getId());%>','<% out.print(((Produit) produits.get(i)).getNom());%>','<% out.print(((Produit) produits.get(i)).getImage());%>')"><span class='glyphicon glyphicon-shopping-cart'></span>Ajouter au favorie</a>
				 
				     </td>
				       
			
					  					<%} else {out.println("<td> <a  class='btn btn-warning btn-sm' onclick='aime("+((Produit) produits.get(i)).getId()+")'       ><span class='glyphicon glyphicon-heart'></span> ajouter au Favorie</a> </td> ");}
					  					out.println("</tr>");
				}
				
			}
		%>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <footer class="main-footer"  ng-app="">
 <!-- Modal3 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center> <h4 class="modal-title">Ajouter Panier</h4></center>
      </div>
      <div class="modal-body">
       
        <form method="post" action="AjouterPanier">
  <div class="form-group">
  
 <input type="hidden"  class="form-control" id="idp" name="idp">
  <center>  <img src="img/panier.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment ajouter  ce produit au panier !</a></center>
    <label for="nm">saisir la Quantite :</label>
    <input type="number" class="form-control" id="qte" name="qte"  required  min="0" >

   
     
         
      </div>
      <div class="modal-footer">
         <center>
       
        
        <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>Ajouter au panier</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
        </center>
     
        </form>
        
      </div> </div> </div></div>
      <!-- Modal -->
<div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Consulter Liste des paniers </h4>
      </div>
      <div class="modal-body">
        
<form  action="AjouterUser" method="post">
  <div class="form-group">
   <table id="mytable" class="table table-bordered table-hover table-striped">
                          <thead>
                          <tr>
                          <th>Designation</th>
                          <th>Libelle</th>
                          <th>Categorie</th>
                          <th>prix</th>
                          <th>Quantite Commander</th>
                          <th>Image</th>
                          <th>Action</th>
                          </tr>
                          </thead>
                          <tbody>
 
<%
Panier pan =(Panier)session.getAttribute("panier");
if (pan != null) {
	
	for (int i = 0; i < pan.getProduits().size(); i++) 
	{
		out.println("<tr>");
		out.println("<td> " + pan.getId()+ "</td>");
		out.println("<td> " + ((Produit) pan.getProduits().get(i)).getLibelle() + "</td>");
		out.println("<td> " + ((Produit) pan.getProduits().get(i)).getCategorie().getNom() + "</td>");
		out.println("<td> " + ((Produit) pan.getProduits().get(i)).getPrix() + "</td>");
		out.println("<td> 0 </td>");
		out.println("<td><img width='120px' heigth='120px' src='image/"+((Produit) pan.getProduits().get(i)).getImage()+"'/></td>");
		
		
		out.println(" <td><a class='btn btn-Success btn-sm'  href ='ValiderPanier?idpp="+u.getCin()+"'  onclick='return confirm(\"Voulez vous vraiment passer la commande ?\")'      ><span class='glyphicon glyphicon-eur'></span>  Acheter </a> </td>");
	       

	
		out.println("</tr>");
	}
	
}

		%>
                         
                     
             </tbody>             
    </table>
   
  </div>
  

        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
        <button type="submit" class="btn btn-info" >CONFIRMER</button><br>
         Voullez-Vous appuyer sur CONFIRMER  pour valider la processus.<br><br>
        </form>
</div>
  </div></div></div></div>	
      <!-- modal favorie -->
         <!-- Modal3 -->
<div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center> <h4 class="modal-title">Envoyer message</h4></center>
      </div>
      <div class="modal-body">
       
        <form action="EnvoyerMessage" method="post" >


                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">
                                    <input class="form-control" name="objet" placeholder="objet" type="text" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                              
                                    <input type="text" style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" name="message" id="message"  ng-minlength="3" ng-maxlength="30" required autofocus />
          

                                </div>
                            </div>

   
     
         
      </div>
      <div class="modal-footer">
         <center>
       
        
        <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>Envoyer message</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
        </center>
     
        </form>
        
      </div> </div> </div></div>
      <!-- Modal3 -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center> <h4 class="modal-title">Ajouter Produit au liste favorie</h4></center>
      </div>
      <div class="modal-body">
       
        <form method="post" action="AjouterProduitFavorie">
  <div class="form-group">
   <input type="hidden"  class="form-control" id="idu" name="idu" value="<%out.print(u.getCin());%>">
 <input type="hidden"  class="form-control" id="idpp" name="idpp">
  <center>  <img src="img/fav.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment ajouter  ce produit au liste favorie !</a></center>


   
     
         
      </div>
      <div class="modal-footer">
         <center>
       
        
        <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>Ajouter au favorie</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
        </center>
     
        </form>
        
      </div> </div> </div></div>
      <!-- envoyer message -->
     

 
    </footer>

<script>

$.fn.dataTable.ext.search.push(
	    function( settings, data, dataIndex ) {
	        var min = parseInt( $('#min').val(), 10 );
	        var max = parseInt( $('#max').val(), 10 );
	        var age = parseFloat( data[4] ) || 0; // use data for the age column
	 
	        if ( ( isNaN( min ) && isNaN( max ) ) ||
	             ( isNaN( min ) && age <= max ) ||
	             ( min <= age   && isNaN( max ) ) ||
	             ( min <= age   && age <= max ) )
	        {
	            return true;
	        }
	        return false;
	    }
	);
</script>

<script>
$(document).ready(function() {
	
	 var table = $('#example1').DataTable({
		 bInfo: false,
	    	 bLengthChange: false,
	    	 "oLanguage": {
	             "sSearch": "Chercher un produit :"
	         },
	 initComplete: function () {
		 this.api().columns('.select-filter').every( function ()  {
             var column = this;
             var select = $('<select><option value=""></option></select>')
                 .appendTo( $(column.footer()).empty() )
                 .on( 'change', function () {
                     var val = $.fn.dataTable.util.escapeRegex(
                         $(this).val()
                     );

                     column
                         .search( val ? '^'+val+'$' : '', true, false )
                         .draw();
                 } );
             

             column.data().unique().sort().each( function ( d, j ) {
                 select.append( '<option value="'+d+'">'+d+'</option>' )
             } );
         } );
     }
		});
	  $('#min, #max').keyup( function() {
	        table.draw();
	    } );
	    
	  $('.filter').on('change',function(){ filtercol($('#cat').attr('data-target'));
	    });

  });
function filtercol(i){
	$('#example1').DataTable().column(i).search($('#cat').val(),false,true).draw();
	}
</script>

 <script type="text/javascript">
 function Envoyer(){
		
	  $("#contact").modal();
   }   
  
 function Consulter(){
	  
 	 
	  $('#myModal8').modal();
  
}
     
      </script>
      
<script>


</script>
 <script type="text/javascript">
       $.cookie.json = true;
       var panier=[];
       
    		   function FavorieProduit(idp,nom,image_p){
    		      	  $("#idpp").val(idp);
    		      	  $("#nomm").text(nom);
    		      	  $("#image_pp").val(image_p);
    		      	  $('#myModal4').modal();
    		      	
    		      	  
    		        }  
       function AjouterProduit(idp,nom){
      	  $("#idp").val(idp);
      	  $("#nom").text(nom);
     
      	  $('#myModal3').modal();
      	
      	  
        }   

     
       </script>
  <script>
          angular.module('myApp', [])
          .controller('AppController', [function() {
            
      }]);
  </script>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js">
      </script> 

</body>
</html>
