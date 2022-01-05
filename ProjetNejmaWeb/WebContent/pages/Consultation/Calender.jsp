 <%@include file="../../MenuAdminV3.jsp" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- fullCalendar 2.2.5-->
  <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.min.css">
  <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar.print.css" media="print">
  <!-- Theme style -->

  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
 

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
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
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success"><%out.println(request.getAttribute("nbrMsgA")); %></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Vous avez <%out.println(request.getAttribute("nbrMsgA")); %> messages</li>
                  <li>
                <!-- inner menu: contains the actual data -->
                <%
ArrayList<Message> msg =(ArrayList<Message>)request.getAttribute("ListMessageRecent");
			if (msg != null) {
				
				for (int i = 0; i < msg.size(); i++) 
				{
					
					out.println("<ul class='menu'> " + ((Message) msg.get(i)).getUtilisateur().getMail()+ "</ul>");}}  %>
               
                 
                
              </li>
                           <button type="submit" onclick="location.href = 'ConsulterListeMessage';"   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class='glyphicon glyphicon-envelope'></span>liste message</span></button>
              
                       <li class="footer"><button type="submit" onclick='ListeMessage()'   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class='glyphicon glyphicon-envelope'></span>Voir tous les messages</span></button></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning"><%out.println(request.getAttribute("nbrClientInscrit")); %></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Vous avez <%out.println(request.getAttribute("nbrClientInscrit")); %> notifications</li>
             
              
              <li class="footer"> <button type="submit" onclick='ListeInscription()'   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Voir tous les invitation</span></button>
        </li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger"><%out.println(request.getAttribute("nbrNC")); %></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">Vous avez <%out.println(request.getAttribute("nbrNC")); %> nouveaux Commande</li>
              <li>
                <!-- inner menu: contains the actual data -->
              
              </li>
              <li class="footer">
             <button type="submit" onclick="location.href = 'ConsulterListeCommande';"   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class='glyphicon glyphicon-envelope'></span>Voir tous les Commandes</span></button>
            
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
                  <%=u.getNom()%> <%=u.getPrenom()%> - <%=u.getType()%> société NEJMA
                  <small>Member since 2017</small>
                </p>
              </li>
              <!-- Menu Body -->
             
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="MonProfile" class="btn btn-default btn-flat">Profile</a>
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
            <li class="active"><a href="HomeAdmin"><i class="fa fa-circle-o"></i> Statistique génerale</a></li>
           
          </ul>
        </li>
       
    
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>graphiques</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
             
          </a>
          <ul class="treeview-menu">
          <li><a href="BarChart"><i class="fa fa-circle-o"></i> Apport quotidient dans 3 jours</a></li>
          <li><a href="BarChartCategorie"><i class="fa fa-circle-o"></i> Statistique categorie</a></li>
            <li><a href="StatestiqueProduitGloble"><i class="fa fa-circle-o"></i> Statestique Produit</a></li>
          <li><a href="PeeChart"><i class="fa fa-circle-o"></i> Statistique de stock</a></li>
          <li><a href="ParetoChart"><i class="fa fa-circle-o"></i> Pareto chart produit</a></li>
            <li><a href="CircularGaugesProduit"><i class="fa fa-circle-o"></i> Circular Gauges Produit</a></li>
            <li><a href="StatestiqueMens"><i class="fa fa-circle-o"></i> Satestique mensuel</a></li>
             <li><a href="StatestiqueAnnuel"><i class="fa fa-circle-o"></i> Satestique annuel</a></li>
            
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
            <li><a href="ConsulterListeUtilisateur"><i class="fa fa-circle-o"></i> Consulter liste utilisateurs</a></li>
            <li><a href="ConsulterListeCategorie"><i class="fa fa-circle-o"></i> Consulter liste categories</a></li>
            <li><a href="ConsulterListeProduit"><i class="fa fa-circle-o"></i> Consulter liste produits</a></li>
             <li><a href="ConsulterListeMessage"><i class="fa fa-circle-o"></i> Consulter liste messages</a></li>
            <li><a href="ConsulterListeCommande"><i class="fa fa-circle-o"></i> Consulter liste commandes</a></li>
           <li><a href="ConsulterListeDemmande"><i class="fa fa-circle-o"></i> Consulter liste Demandes</a></li>
            <li><a href="ConsulterListeFacture"><i class="fa fa-circle-o"></i> Consulter liste factures </a></li>
          </ul>
        </li>
       
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>Tables</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          <li><a href="ConsulterListeCategorie"><i class="fa fa-circle-o"></i> Consulter liste categories</a></li>
          </ul>
        </li>
        <li>
          <a href="Calender">
            <i class="fa fa-calendar"></i> <span>Calenddrier</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-red">3</small>
              <small class="label pull-right bg-blue">17</small>
            </span>
          </a>
        </li>
        </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Left side column. contains the logo and sidebar -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
 <!-- Content Header (Page header) -->
    <section class="content-header">
     <div class="row">
     <button type="submit" onclick="printdiv('divID');"    value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-print">Imprimer emploi</span></button>
        
     </div>
    </section>

    <!-- Main content -->
    <section class="content" id="imprime_moi">
      <div class="row">
        <div class="col-md-3">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h4 class="box-title">Draggable Événements</h4>
            </div>
            <div class="box-body">
              <!-- the events -->
              <div id="external-events">
               
                <div class="external-event bg-yellow">travail</div>
                <div class="external-event bg-aqua">repos</div>
                <div class="external-event bg-light-blue">Voyage</div>
            
                <div class="checkbox">
                  <label for="drop-remove">
                    <input type="checkbox" id="drop-remove">
                    Supprimer après la chute
                  </label>
                </div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Ajouter évennement</h3>
            </div>
            <div class="box-body">
              <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                <!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
                <ul class="fc-color-picker" id="color-chooser">
                  <li><a class="text-aqua" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-blue" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-light-blue" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-teal" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-yellow" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-orange" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-green" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-lime" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-red" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-purple" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-muted" href="#"><i class="fa fa-square"></i></a></li>
                  <li><a class="text-navy" href="#"><i class="fa fa-square"></i></a></li>
                </ul>
              </div>
              <!-- /btn-group -->
              <div class="input-group">
                <input id="new-event" type="text" class="form-control" placeholder="Event Title">

                <div class="input-group-btn">
                  <button id="add-new-event" type="button" class="btn btn-primary btn-flat">Ajouter</button>
                </div>
                <!-- /btn-group -->
              </div>
              <!-- /input-group -->
            </div>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-md-9">
        
          <div class="box box-primary" id='divID'>
       
            <div class="box-body no-padding">
      
              <!-- THE CALENDAR -->
              <div id="calendar" ></div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
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

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  <div class="modal fade" id="ins" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Profil Utilisateur </h4>
      </div>
      <div class="modal-body" ng-controller="AppController as ctrl" >
        
<form   name="invitForm" >
   
      <table id="myTable" class="table table-bordered table-hover table-striped">
                          <thead>
                          <tr>
                          <th>Cin</th>
                         
                          <th>Nom Prenom</th>
                       
                           <th>Login</th>
                          <th>Password</th>
                           <th>Tel</th>
                           <th>Gmail</th>
                     
                         <th>Action</th>
                          </tr>
                          </thead>
                          <tbody>
 
<%
ArrayList<Utilisateur> lisInvit =(ArrayList<Utilisateur>)request.getAttribute("ListInvitation");
			if (lisInvit != null) {
				
				for (int i = 0; i < lisInvit.size(); i++) 
				{
					out.println("<tr>");
					out.println("<td> " + ((Utilisateur) lisInvit.get(i)).getCin()+ "</td>");
					out.println("<td> " + ((Utilisateur) lisInvit.get(i)).getNom() +" "+ ((Utilisateur) lisInvit.get(i)).getPrenom() +  "</td>");
					
					out.println("<td> " + ((Utilisateur) lisInvit.get(i)).getLogin() + "</td>");
					out.println("<td> " + ((Utilisateur) lisInvit.get(i)).getPassword() + "</td>");
					out.println("<td> " + ((Utilisateur) lisInvit.get(i)).getTel() + "</td>");
					out.println("<td> " + ((Utilisateur) lisInvit.get(i)).getMail() + "</td>");
					
					
					out.print("<td>  <a class='btn btn-warning btn-sm' href ='ActiverInvit?cinv="+((Utilisateur) lisInvit.get(i)).getCin()+"'><span class='glyphicon glyphicon-ok-sign'></span>  Activer</a> ");
					out.println(" <a class='btn btn-danger btn-sm'  href ='SupprimerInvit?cinv="+((Utilisateur) lisInvit.get(i)).getCin()+"'  onclick='return confirm(\"Voulez vous vraiment supprimer cet utilisateur ?\")'      ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a></td> ");
				                                 
					out.println("</tr>");
				}
				
			}
		%>
                         
                     
       </tbody>                   
    </table>
       
     
          <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
    
        </form>
</div>
  </div></div></div></div>    
  <div class="modal fade" id="listemessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Profil Utilisateur </h4>
      </div>
      <div class="modal-body" ng-controller="AppController as ctrl" >
        
<form   name="invitForm" >
   
      <table id="example1" class="table table-bordered table-striped" >
                <thead>
             <tr>
             
            <th class="select-filter">Date</th>
                <th >Cin</th>
                          <th>Nom Prenom</th>
                          
                          <th>Gmail</th>
                          <th>Objet</th>
                          
                          <th class="select-filter">type</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
              
               <th class="select-filter">Date</th>
                <th >Cin</th>
                          <th>Nom Prenom</th>
                         
                          <th>Gmail</th>
                          <th>Objet</th>
                          
                          <th class="select-filter">type</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
ArrayList<Message> mess =(ArrayList<Message>)request.getAttribute("listmessage");
			if (mess != null) {
			
				for (int i = 0; i < mess.size(); i++) 
				{%>
					<tr>
					<%
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					
					out.println("<td> " + df.format(((Message)mess.get(i)).getDate())+ "</td>");
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getCin()+ "</td>");
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getNom() +" "+ ((Message)mess.get(i)).getUtilisateur().getPrenom() +  "</td>");
				
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getMail()+ "</td>");
					
					out.println("<td> " + ((Message)mess.get(i)).getObjet()+ "</td>");
					
				
				
					
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getType() + "</td>");
					out.println("<td> <a  class='btn btn-warning btn-sm' onclick='Contact("+((Message)mess.get(i)).getUtilisateur().getCin()+")'       ><span class='glyphicon glyphicon-envelope'></span>  Repondre</a>  ");
								                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         			
	out.println(" <a class='btn btn-danger btn-sm'  onclick='supprimer("+((Message)mess.get(i)).getId()+")'     ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a> ");

				       
				     %> 
				     </td>
				       
					
					  					<%
					  					out.println("</tr>");
				}
				
			}
		%>
                </tbody>
              </table>
       
     
          <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
    
        </form>
</div>
  </div></div></div></div>  
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->

<!-- Bootstrap 3.3.6 -->

<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>

<!-- fullCalendar 2.2.5 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/fullcalendar/fullcalendar.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex: 1070,
          revert: true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        });

      });
    }

    ini_events($('#external-events div.external-event'));

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date();
    var d = date.getDate(),
        m = date.getMonth(),
        y = date.getFullYear();
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      buttonText: {
        today: 'today',
        month: 'month',
        week: 'week',
        day: 'day'
      },
      //Random default events
     
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar !!!
      drop: function (date, allDay) { // this function is called when something is dropped

        // retrieve the dropped element's stored Event Object
        var originalEventObject = $(this).data('eventObject');

        // we need to copy it, so that multiple events don't have a reference to the same object
        var copiedEventObject = $.extend({}, originalEventObject);

        // assign it the date that was reported
        copiedEventObject.start = date;
        copiedEventObject.allDay = allDay;
        copiedEventObject.backgroundColor = $(this).css("background-color");
        copiedEventObject.borderColor = $(this).css("border-color");

        // render the event on the calendar
        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

        // is the "remove after drop" checkbox checked?
        if ($('#drop-remove').is(':checked')) {
          // if so, remove the element from the "Draggable Events" list
          $(this).remove();
        }

      }
    });

    /* ADDING EVENTS */
    var currColor = "#3c8dbc"; //Red by default
    //Color chooser button
    var colorChooser = $("#color-chooser-btn");
    $("#color-chooser > li > a").click(function (e) {
      e.preventDefault();
      //Save color
      currColor = $(this).css("color");
      //Add color effect to button
      $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
    });
    $("#add-new-event").click(function (e) {
      e.preventDefault();
      //Get value and make sure it is not null
      var val = $("#new-event").val();
      if (val.length == 0) {
        return;
      }

      //Create events
      var event = $("<div />");
      event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
      event.html(val);
      $('#external-events').prepend(event);

      //Add draggable funtionality
      ini_events(event);

      //Remove event from text input
      $("#new-event").val("");
    });
  });
</script>
<script language="javascript" type="text/javascript">
    function printdiv(divID)
    {
      var headstr = "<html><head><title></title></head><body>";
      var footstr = "</body>";
      var newstr = document.all.item(divID).innerHTML;
      var oldstr = document.body.innerHTML;
      document.body.innerHTML = headstr+newstr+footstr;
      window.print();
      document.body.innerHTML = oldstr;
      return false;
    }
</script>
 <script>
function ListeInscription(){

	  $("#ins").modal();
	
	  
}  
</script>
  <script>
  function ListeMessage(){

	  $("#listemessage").modal();
	
	  
  } </script>
</body>
</html>
