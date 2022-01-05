  <%@include file="../../MenuAdminV3.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.anychart.com/js/7.13.0/anychart-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.anychart.com/css/7.13.0/anychart-ui.min.css" />
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
   
        <li><a href="#"></a></li>
        <li class="active"></li>
      </ol>
    </section>


    <!-- Main content -->
    <section class="content">
    <center><h1>Statestique génerale</h1></center>
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
             
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Messages en attente</span>
              <span class="info-box-number"><%out.println(request.getAttribute("cma")); %></span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
                   
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->  
         <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="fa fa-thumbs-o-up"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Produit favorie</span>
              <span class="info-box-number"><%Panier pff=(Panier)session.getAttribute("favorie"); if(pff!=null && pff.getProduits()!=null ){out.print(pff.getProduits().size());}else{ %><%out.println(request.getAttribute("nbrPF")); }%></span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
                   
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
         <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><i class="fa fa-bookmark-o"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Commande actif</span>
              <span class="info-box-number"><%out.println(request.getAttribute("cca")); %></span>

              <div class="progress">
                <div class="progress-bar" style="width: <%out.println(request.getAttribute("cca"));%>%"></div>
              </div>
                  <span class="progress-description">
                    
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
         <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="fa fa-calendar"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Commande en attente</span>
              <span class="info-box-number"><%out.println(request.getAttribute("ccna")); %></span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
                    
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          
          <!-- /.info-box -->
        </div>
        <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><%out.println(request.getAttribute("totc")); %></h3>

              <p>Nombre total commande</p>
            </div>
            <div class="icon">
              <i class="fa fa-shopping-cart"></i>
            </div>
            <a href="ConsulterListeCommande" class="small-box-footer">
              Detail <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><%out.println(request.getAttribute("smmt")); %><sup style="font-size: 20px">TND</sup></h3>

              <p>Montant total payé</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="ConsulterListeFacture" class="small-box-footer">
              Detail <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%out.println(request.getAttribute("totm")); %></h3>

              <p>Nombre Total message</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="ConsulterListeUtilisateur" class="small-box-footer">
              Detail <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
            <h3><%out.println(u.getPoint()); %><sup style="font-size: 20px">PTS</sup></h3>

              <p>Mes points d'achat</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">
              Detail <i class="fa fa-arrow-circle-right"></i>
            </a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
        
  </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div id="container">
        
        </div>
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
    <script type="text/javascript">
anychart.onDocumentReady(function () {
    // create data set on our data
    var dataSet = anychart.data.set([
    	["Janvier",<%out.print(request.getAttribute("rmj"));%>],
    	["Fevrier",,<%out.print(request.getAttribute("rmf"));%>],
    	["Mars",,,<%out.print(request.getAttribute("rmm"));%>],
    	["Avril",,,,<%out.print(request.getAttribute("rma"));%>],
    	["Mail",,,,,<%out.print(request.getAttribute("rmma"));%>],
    	["Juin",,,,,,<%out.print(request.getAttribute("rmju"));%>],



        ]);
   

    // map data for the first series, take x from the zero column and value from the first column of data set
    var seriesData_1 = dataSet.mapAs({x: [0], value: [1]});

    // map data for the second series, take x from the zero column and value from the second column of data set
    var seriesData_2 = dataSet.mapAs({x: [0], value: [2]});

    // map data for the third series, take x from the zero column and value from the third column of data set
    var seriesData_3 = dataSet.mapAs({x: [0], value: [3]});

    // map data for the fourth series, take x from the zero column and value from the fourth column of data set
    var seriesData_4 = dataSet.mapAs({x: [0], value: [4]});
    var seriesData_5 = dataSet.mapAs({x: [0], value: [5]});
    var seriesData_6 = dataSet.mapAs({x: [0], value: [6]});
    var seriesData_7 = dataSet.mapAs({x: [0], value: [7]});
    var seriesData_8 = dataSet.mapAs({x: [0], value: [8]});
    var seriesData_9 = dataSet.mapAs({x: [0], value: [9]});
    var seriesData_10 = dataSet.mapAs({x: [0], value: [10]});
    var seriesData_11= dataSet.mapAs({x: [0], value: [11]});
    var seriesData_12= dataSet.mapAs({x: [0], value: [12]});
    // create bar chart
    chart = anychart.bar();

    // turn on chart animation
    chart.animation(true);

    // set container id for the chart
    chart.container('container');
    chart.padding([10, 40, 5, 20,0,6,0,0,0,0,0,0]);

    // set chart title text settings
    chart.title('Statistique mes commandes dans cet année');
    chart.title().padding([0, 0, 10, 0,0,0,0,0,0,0,0,0]);

    // set scale minimum
    chart.yScale().minimum(0);

    chart.xAxis().labels().rotation(-90).padding([0, 0, 20, 0,0,0,0,0,0,0,0,0]);

    chart.yAxis().labels().textFormatter(function () {
        return this.value.toLocaleString();
    });

    // set titles for Y-axis
    chart.yAxis().title('en Dinar tunisien');

    // helper function to setup settings for series
    var setupSeries = function (series, name) {
        var seriesLabels = series.labels();
        series.hoverLabels().enabled(false);
        seriesLabels.enabled(true);
        seriesLabels.position('right');
        seriesLabels.textFormatter(function () {
            return 'TND ' + this.value.toLocaleString();
        });
        series.name(name);
        seriesLabels.anchor('left');
        series.tooltip().titleFormatter(function () {
            return this.x;
        });
        series.tooltip().textFormatter(function () {
            return this.seriesName + ': TND ' + parseInt(this.value).toLocaleString();
        });
        series.tooltip().position('right').anchor('left').offsetX(5).offsetY(0);
    };

    // temp variable to store series instance
    var series;

    // create first series with mapped data
    series = chart.bar(seriesData_1);
    setupSeries(series, 'Janvier');

    // create second series with mapped data
    series = chart.bar(seriesData_2);
    setupSeries(series, 'Fevrier');

    // create third series with mapped data
    series = chart.bar(seriesData_3);
    setupSeries(series, 'Mars');

    // create fourth series with mapped data
 series = chart.bar(seriesData_4);
    setupSeries(series, 'Avril');
    series = chart.bar(seriesData_5);
    setupSeries(series, 'Mais');
    series = chart.bar(seriesData_6);
    setupSeries(series, 'Juin');
    series = chart.bar(seriesData_7);
    setupSeries(series, 'juilet');
    series = chart.bar(seriesData_8);
    setupSeries(series, 'Out');
    series = chart.bar(seriesData_9);
    setupSeries(series, 'september');
    series = chart.bar(seriesData_10);
    setupSeries(series, 'octobre');
    series = chart.bar(seriesData_11);
    setupSeries(series, 'November');
    series = chart.bar(seriesData_12);
    setupSeries(series, 'Dicembre');
    // turn on legend
    chart.legend().enabled(true).fontSize(13).padding([0, 0, 20, 0,0,0,0,0,0,0]);

    chart.interactivity().hoverMode('single');
    chart.tooltip().positionMode('point');

    // initiate chart drawing
    chart.draw();
});
    
    </script>
</body>
</html>
