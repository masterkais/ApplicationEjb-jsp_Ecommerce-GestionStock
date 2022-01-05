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
   <span class="label label-danger"><%Panier pf=(Panier)session.getAttribute("favorie"); if(pf!=null && pf.getProduits()!=null ){out.print(pf.getProduits().size()); }%></span>

            </a>
            <ul class="dropdown-menu">
              <li class="header">vous avez <%Panier pss=(Panier)session.getAttribute("favorie"); if(pss!=null && pss.getProduits()!=null ){out.print(pss.getProduits().size());} %> produits favorie</li>
              
              <li class="footer">
               <li class="footer"><button class="btn btn-primary btn-lg btn-block" onclick="location.href = 'ConsulterListeFavorie';"  ><span class='glyphicon glyphicon-shopping-cart'></span>Consulter liste favorie</span></button></li>
         
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
              <li class="footer"><button type="submit" onclick="location.href = 'ConsulterListeMessagClient';"   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class='glyphicon glyphicon-envelope'></span>Voir tous les messages</span></button></li>
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
               <li class="footer"><button class="btn btn-primary btn-lg btn-block" onclick="location.href = 'ConsulterListePanier';"  ><span class='glyphicon glyphicon-shopping-cart'></span>Consulter vos panier</span></button></li>
         
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
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

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
                    <p> Vous etes entrain de consulter liste produit</p>
                 <%} 
                       session.removeAttribute("notif");
                 %>
                        <br />  
                  
                   </div>
          <div class="box">
            <div class="box-header">
              <center><h3 class="box-title">Mon liste de produit favorie</h3></center>
                <ol class="breadcrumb">
                 <a type="button" href="ViderListeFavorie" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-folder-close"></span> Vider la liste</a>
     
        <ul class="nav navbar-nav navbar-right">
                
     <a type="button" href="ConsulterListeProduitClient" class="btn btn-success btn-lg btn3d"><span class="glyphicon glyphicon-hand-left"></span> Contenu Achat</a>
                 
                 
                 </ul>
        
      </ol>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                                 
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
Panier prods =(Panier)session.getAttribute("favorie");
			if (prods != null) {
				
				for (int i = 0; i < prods.getProduits().size(); i++) 
				{
					out.println("<tr>");
					out.println("<td> " + ((Produit) prods.getProduits().get(i)).getNom()+ "</td>");
					out.println("<td> " + ((Produit) prods.getProduits().get(i)).getLibelle() + "</td>");
					out.println("<td> " + ((Produit) prods.getProduits().get(i)).getCategorie().getNom()+ "</td>");
					out.println("<td> " + ((Produit) prods.getProduits().get(i)).getPrix() + "</td>");
					out.println("<td>"+ ((Produit) prods.getProduits().get(i)).getQuantite() +"</td>");
					out.println("<td><img width='120px' heigth='120px' src='image/"+((Produit) prods.getProduits().get(i)).getImage()+"'/></td>");
					
					%>
					<td> <a  class='btn btn-info btn-sm' data-toggle='modal' onclick="AjouterProduit('<% out.print(((Produit) prods.getProduits().get(i)).getId());%>','<% out.print(((Produit) prods.getProduits().get(i)).getNom());%>','<% out.print(((Produit) prods.getProduits().get(i)).getImage());%>')"><span class='glyphicon glyphicon-shopping-cart'></span>Ajouter au panier</a>
					<%
					out.println(" <a class='btn btn-danger btn-sm'  href ='SupprimerProduitFavorie?id="+((Produit) prods.getProduits().get(i)).getId()+"'  onclick='return confirm(\"Voulez vous vraiment supprimer ce produit ?\")'      ><span class='glyphicon glyphicon-trash'></span>  Supprimer produit</a> </td>");
				       

				
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
       
        <form method="post" action="AjouterProduitFavorieAuPanier">
  <div class="form-group">
  
 <input type="hidden"  class="form-control" id="idp" name="idp">
  <center>  <img src="img/panier.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment ajouter  ce produit au panier !</a></center>
    <label for="nm">saisir la Quantite :</label>
    <input type="number" class="form-control" id="qte" name="qte" value="" required>

   
     
         
      </div>
      <div class="modal-footer">
         <center>
       
        
        <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>Ajouter au panier</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
        </center>
     
        </form>
        
      </div> </div> </div></div>
    
      
 
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
	             "sSearch": "Search all columns:"
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
      
  
 function Consulter(){
	  
 	 
	  $('#myModal8').modal();
  
}
     
      </script>
      
<script>


</script>
 <script type="text/javascript">
       $.cookie.json = true;
       var panier=[];
       function AjouterProduit(idp,nom,image_p){
      	  $("#idp").val(idp);
      	  $("#nom").text(nom);
      	  $("#image_p").val(image_p);
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
<script></script>
<script>
function Contenu(i,n,l,q,p,c,im){

	 $("#idpp").val(i);
	 $("#nompp").val(n);
	 $("#libb").val(l);
	 $("#qtt").val(q);
	
	 $("#prixx").val(p);
	 $("#idcateg").val(c);
	 $("#imgg").val(im);
    $("#myModal1").modal("show");
   

}

</script>
</body>
</html>
