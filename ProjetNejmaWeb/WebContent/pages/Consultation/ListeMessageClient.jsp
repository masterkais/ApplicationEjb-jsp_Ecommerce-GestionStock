  <%@include file="../../MenuAdminV3.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

#img:hover
{
   width:60%;
   height:60%;
}
.gold{
	color: #FFBF00;
}

/*********************************************
					PRODUCTS
*********************************************/

.product{
	border: 1px solid #dddddd;
	height: 321px;
}

.product>img{
	max-width: 230px;
}

.product-rating{
	font-size: 20px;
	margin-bottom: 25px;
}

.product-title{
	font-size: 20px;
}

.product-desc{
	font-size: 14px;
}

.product-price{
	font-size: 22px;
}

.product-stock{
	color: #74DF00;
	font-size: 20px;
	margin-top: 10px;
}

.product-info{
		margin-top: 50px;
}

/*********************************************
					VIEW
*********************************************/


.container-fluid{
	max-width: 1140px;
	margin: 0 auto;
}

.view-wrapper {
	float: right;
	max-width: 70%;
	margin-top: 25px;
}

.container {
	padding-left: 0px;
	padding-right: 0px;
	max-width: 100%;
}

/*********************************************
				ITEM 
*********************************************/

.service1-items {
	padding: 0px 0 0px 0;
	float: left;
	position: relative;
	overflow: hidden;
	max-width: 100%;
	height: 321px;
	width: 130px;
}

.service1-item {
	height: 107px;
	width: 120px;
	display: block;
	float: left;
	position: relative;
	padding-right: 20px;
	border-right: 1px solid #DDD;
	border-top: 1px solid #DDD;
	border-bottom: 1px solid #DDD;
}

.service1-item > img {
	max-height: 110px;
	max-width: 110px;
	opacity: 0.6;
	transition: all .2s ease-in;
	-o-transition: all .2s ease-in;
	-moz-transition: all .2s ease-in;
	-webkit-transition: all .2s ease-in;
}

.service1-item > img:hover {
	cursor: pointer;
	opacity: 1;
}

.service-image-left {
	padding-right: 50px;
}

.service-image-right {
	padding-left: 50px;
}

.service-image-left > center > img,.service-image-right > center > img{
	max-height: 155px;


</style>
   <link rel="stylesheet" href="tcss/jquery-ui-1.10.2.custom.min.css">

      <link href="tcss/bootstrap.min.css" rel="stylesheet">
    <link href="tcss/font-awesome.min.css" rel="stylesheet">
    <link href="tcss/prettyPhoto.css" rel="stylesheet">
    <link href="tcss/price-range.css" rel="stylesheet">
    <link href="tcss/animate.css" rel="stylesheet">
	<link href="tcss/main.css" rel="stylesheet">
	<link href="tcss/responsive.css" rel="stylesheet">


</head>

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
              
              <li class="footer"> <div><button  onclick="location.href = 'ConsulterListeCommandeClient';"    ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Consulte mes  commandes </span></button></div>
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
               <li class="footer"><button class="btn btn-primary btn-lg btn-block" type="button">
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
                  <a href="ProfileClient" class="btn btn-default btn-flat">Profile</a>
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
            <li class="active"><a href="HomeClient"><i class="fa fa-circle-o"></i> Statestique generale</a></li>
          
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>Offres </span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">1</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="ConsulterListeProduitPromotion"><i class="fa fa-circle-o"></i> Produits en promotion</a></li>
          
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
            <li><a href="ConsulterListeProduitClientRange"><i class="fa fa-circle-o"></i> Consulter liste produits V1</a></li>
              <li><a href="ConsulterListeProduitClient"><i class="fa fa-circle-o"></i> Consulter liste produits V2</a></li>
             <li><a href="ConsulterListeMessageClient"><i class="fa fa-circle-o"></i> Consulter liste messages</a></li>
            <li><a href="ConsulterListeCommandeClient"><i class="fa fa-circle-o"></i> Consulter liste commandes</a></li>
          
            <li><a href="ConsulterListeFactureClient"><i class="fa fa-circle-o"></i> Consulter liste factures </a></li>
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
        
   <%
                    String tr=(String)session.getAttribute("notif");
                       if(tr!=null  && !tr.equals("")){
                   %>
    <div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        
                    <span class="glyphicon glyphicon-ok"></span> <%out.print(tr);
                       } %>
                        <br />  
                 
                   </div>
                       <%
                    
                    session.removeAttribute("notif");
                    %>
          <div class="box">
            <div class="box-header">
              <center><h3 class="box-title">Mes messages</h3></center>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <table id="example1" class="table table-bordered table-striped" >
                <thead>
             <tr>
             <th></th>
              <th class="select-filter">Type Message</th>
              <th class="select-filter">Etat</th>
             <th class="select-filter">Date</th>
              
                          <th>Adresse emetteur</th>
                        
                          <th>Adresse recepteur</th>
                          <th>Objet</th>
                         
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
               <th></th>
                 <th class="select-filter">Type Message</th>
               <th class="select-filter">Etat</th>
               <th class="select-filter">Date</th>
              
                          <th>Adresse emetteur</th>
                        
                          <th>Adresse recepteur</th>
                          <th>Objet</th>
                       
                          <th class="datatable-nosort">action</th>
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
ArrayList<Message> messages =(ArrayList<Message>)request.getAttribute("listmessage");
			if (messages != null) {
			
				for (int i = 0; i < messages.size(); i++) 
				{%>
					<tr>
					<td><img  onclick="Detail('<% out.print(((Message)messages.get(i)).getMessage());%>')" src="img/envelope.png"></td>
					<%
					if(((Message)messages.get(i)).getEtat().equals("ca")){out.println("<td>envoyer </td>");}
					else if (((Message)messages.get(i)).getEtat().equals("ac")){out.println("<td>recu </td>");}
					if(((Message)messages.get(i)).getValide()==0){out.println("<td>en attente</td>");}
					else if(((Message)messages.get(i)).getValide()==1) {out.println("<td>Deja repondre</td>");}
					else{out.println("<td> Site a deja vue leur message</td>");}
					
					out.println("<td> " + ((Message)messages.get(i)).getDate()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getAdrEmeteur() + "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getAdrRecepteur()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getObjet()+ "</td>");
					if(((Message)messages.get(i)).getEtat().equals("ca")){%><td> <a  class='btn btn-info btn-sm' data-toggle='modal' onclick="Envoyer()"><span class='glyphicon glyphicon-pencil'>Nouveau</span></a>
				 
				     </td><%} else if( ((Message)messages.get(i)).getEtat().equals("ac")){
		%>
				
					<td> <a  class='btn btn-info btn-sm' data-toggle='modal' onclick="Contact('<% out.print(((Message)messages.get(i)).getId());%>','<% out.print(((Message)messages.get(i)).getUtilisateur().getCin());%>')"><span class='glyphicon glyphicon-pencil'>Repondre</span></a>
				 
				     </td>
				       
					
					  					<%}
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
  
  <footer class="main-footer">
    </footer> 
      <!-- Modal3 -->
<div class="modal fade" id="contact1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        
           <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Supprision </h4>
      </div>
      <div class="modal-body">
   
<form  method="post"   action="SupprimerMessage"  name="userrrForm" novalidate>
  <input type="text" id="idmes" name="idmes" class="form-control" >
   <center>  <img src="dist/img/Supprimer.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment supprimer ce message !</a></center>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
        
  <button type="submit" class="btn btn-info" >CONFIRMER</button><br>
        
        </form>
</div>
  </div></div></div></div>  
 <!-- ajouter des message -->
 <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="contactLabel" aria-hidden="true" ng-controller="AppController as ctrl">
            <div class="modal-dialog">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-info-sign"></span> Traitez le message.</h4>
                    </div>
                    <form action="RepondreMessage" method="post"  name="messageForm">
                    <div class="modal-body" style="padding: 5px;">
                          <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                 <input class="form-control" id="idmess" name="idmess" placeholder="idmess" type="hidden" required autofocus />
                                    <input class="form-control" id="cin" name="cin" placeholder="cin" type="hidden" required autofocus />
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                    <input type="hidden" name="emeteur" placeholder="Lastname" type="text"  />
                                </div>
                            </div>
                           
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">
                                    <input class="form-control" name="objet" placeholder="objet" type="text" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" ng-class="{ 'has-error' :messageForm.message.$invalid && !messageForm.message.$pristine }">
                              
                                    <input type="text" style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" name="message" id="message"  ng-minlength="3" ng-maxlength="30" required autofocus />
                <p ng-show="messageForm.message.$error.minlength" class="help-block">message est trop court.</p>
            <p ng-show="messageForm.message.$error.maxlength" class="help-block">message est trop long.</p>
                                </div>
                            </div>
                        </div>  
                        <div class="panel-footer" style="margin-bottom:-14px;">
                            <input type="submit" class="btn btn-success" value="Envoyer"/>
                                <!--<span class="glyphicon glyphicon-ok"></span>-->
                            <input type="reset" class="btn btn-danger" value="Clear" />
                                <!--<span class="glyphicon glyphicon-remove"></span>-->
                            <button style="float: right;" type="button" class="btn btn-default btn-close" data-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  <!-- Detail message -->
      <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Message  </h4>
      </div>
      <div class="modal-body">
   
<form  method="post"   action="RepondreMessageAdmin"  name="ContenuMess" novalidate>
  <input type="text"  readonly="readonly" id="ContenuMessage" name="ContenuMessage" class="form-control" >
  

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
 
        
        </form>
</div>
  </div></div></div></div>  
        

  <script> function supprimer(idmessage){
    	  $("#idmes").val(idmessage);
    	  $("#myModal4").modal();
    	
    	  
      } </script>
 <script type="text/javascript">
 function Contact(idmess,cin){
	 $("#cin").val(cin);
	 $("#idmess").val(idmess);
	  $("#contact").modal();
     }
      </script>
   <script>
          angular.module('myApp', [])
          .controller('AppController', [function() {
            
      }]);
  </script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js">
      </script>  
  <script>

 $(document).ready(function() {
		
	 var table = $('#example1').DataTable({
		 "columnDefs": [ {
	            "searchable": false,
	            "orderable": false,
	            "targets": -1,
	            "visible": true,
	            "paging": false,
	            'bSortable': false,
	            "info": false,
	            "orderMulti": false,
	            "select":false
	        } ],
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
 });
</script>
    <script> function Detail(message){
    	  $("#ContenuMessage").val(message);
    	  $("#myModal5").modal();
    	
    	  
      } 
    function Envoyer(){
		
  	  $("#contact1").modal();
     }   
    
    </script> 
</body>
</html>
