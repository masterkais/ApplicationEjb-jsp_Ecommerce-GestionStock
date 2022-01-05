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
              <li>
                <!-- inner menu: contains the actual data -->
                <%
ArrayList<Utilisateur> invits =(ArrayList<Utilisateur>)request.getAttribute("ListInvitation");
			if (invits != null) {
				
				for (int i = 0; i < invits.size(); i++) 
				{
					
					out.println("<ul class='menu'> " + ((Utilisateur) invits.get(i)).getNom()+' '+((Utilisateur) invits.get(i)).getPrenom()+ "</ul>");}}  %>
               
                 
                
              </li>
              
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
            <span>Options </span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">2</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> #</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> #</a></li>
          </ul>
        </li>
        <li>
          <a href="pages/widgets.html">
            <i class="fa fa-th"></i> <span>Widgets</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-green">Nauveaux</small>
            </span>
          </a>
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
            <li><a href="pages/charts/chartjs.html"><i class="fa fa-circle-o"></i> Courbes JS</a></li>
            <li><a href="pages/charts/morris.html"><i class="fa fa-circle-o"></i>Courbe Morris</a></li>
            <li><a href="pages/charts/flot.html"><i class="fa fa-circle-o"></i> Courbe en ligne</a></li>
            <li><a href="pages/charts/inline.html"><i class="fa fa-circle-o"></i> Statestique Globale</a></li>
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
            <li><a href="#"><i class="fa fa-circle-o"></i>#</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i> #</a></li>
          </ul>
        </li>
        <li>
          <a href="pages/calendar.html">
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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Data Tables
        <small>advanced tables</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>


    <!-- Main content -->
    <section class="content">
      <div class="row">
         <div class="col-md-6">
          <!-- AREA CHART -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Area Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="areaChart" style="height:250px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- DONUT CHART -->
          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Donut Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <canvas id="pieChart" style="height:250px"></canvas>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (LEFT) -->
        <div class="col-md-6">
          <!-- LINE CHART -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Line Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="lineChart" style="height:250px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- BAR CHART -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">Bar Chart</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">
              <div class="chart">
                <canvas id="barChart" style="height:230px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
            <!-- /.row -->
      <!-- Main row -->
      <!-- /.row (main row) -->
      
 </div>
 <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
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
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="../../plugins/chartjs/Chart.min.js"></script>
<!-- FastClick -->
<script src="../../plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- page script -->

  <footer class="main-footer">
    </footer>


  
  <!-- Liste inscription --> 
<!-- model 2 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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



      <!-- Liste message -->
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
             
                          <th>Nom Prenom</th>
                          
                          <th>Gmail</th>
                          <th>Objet</th>
                          
                       
                    
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
              
               <th class="select-filter">Date</th>
              
                          <th>Nom Prenom</th>
                         
                          <th>Gmail</th>
                          <th>Objet</th>
                          
                       
                        
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
ArrayList<Message> messages =(ArrayList<Message>)request.getAttribute("listmessage");
			if (messages != null) {
			
				for (int i = 0; i < messages.size(); i++) 
				{%>
					<tr>
					<%
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					
					out.println("<td> " + df.format(((Message)messages.get(i)).getDate())+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getNom() +" "+ ((Message)messages.get(i)).getUtilisateur().getPrenom() +  "</td>");
				
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getMail()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getObjet()+ "</td>");
					
				
				
				
					out.println("<td> <a  class='btn btn-warning btn-sm' onclick='Contact("+((Message)messages.get(i)).getUtilisateur().getCin()+")'       ><span class='glyphicon glyphicon-envelope'></span>  Repondre</a>  ");
								                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         			
	out.println(" <a class='btn btn-danger btn-sm'  onclick='supprimer("+((Message)messages.get(i)).getId()+")'     ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a> ");

				       
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
 <script>
function format ( dataSource ) {
    var html = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
    
    for (var key in dataSource){
        html += '<tr>'+
                   '<td><button>kk</button></td>'+
                   '<td></td>'+
                '</tr>';
    }        
    return html += '</table>';  
}
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
	  $('#min, #max').keyup( function() {
	        table.draw();
	    } );
	    
	  $('#example1').on('click', 'td.details-control', function () {
          var tr = $(this).closest('tr');
          var row = table.row(tr);

          if (row.child.isShown()) {
              // This row is already open - close it
              row.child.hide();
              tr.removeClass('shown');
          } else {
              // Open this row
              row.child(format({
                  'Designation 1' : tr.data('Designation'),
                  'Key 2' :  tr.data('key-2')
              })).show();
              tr.addClass('shown');
          }
      });

  });
</script>
 <script type="text/javascript">
      
 function AjouterPoint(){
	  $("#myModal5").modal();
     }
 function VoirCommandes(){
	  $("#myModal6").modal();
     }

  
      function ClientFidele(){
    	  $("#myModal4").modal();
          }
      function Ajouter(){

    	  $("#myModal1").modal();
    	
    	  
      }  
      function ListeInscription(){

    	  $("#myModal3").modal();
    	
    	  
      }  
      function ListeMessage(){

    	  $("#listemessage").modal();
    	
    	  
      }  
   
      function Contact(cin){
    		 $("#cin").val(cin);
    		  $("#contact").modal();
    	     }
      </script>
<script>
function Modifier(cin,nom,pren,dat,type,login,password,mail,tel,adresse){

  
    $("#c1").val(cin);
    $("#c2").val(nom);
    $("#c3").val(pren);
    $("#c4").val(dat);
    $("#c5").val(login) ; 
     $("#c6").val(password);
    $("#c7").val(adresse);
    $("#c8").val(mail);
    $("#c9").val(tel);
    $("#c10").val(type);
    $("#myModal2").modal("show");


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
