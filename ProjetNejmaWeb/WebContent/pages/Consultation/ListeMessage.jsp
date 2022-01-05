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
                  <%=u.getNom()%> <%=u.getPrenom()%> - <%=u.getType()%> soci�t� NEJMA
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
            <li class="active"><a href="HomeAdmin"><i class="fa fa-circle-o"></i> Statistique g�nerale</a></li>
           
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
        <div class="col-xs-12">
         <div class="box">

      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%out.println(request.getAttribute("nbrMSG")); %></h3>

              <p>Nombre Totale des messages </p>
            </div>
            <div class="icon">
              <i class="ion-chatboxes"></i>
            </div>
            <a href="#" class="small-box-footer">plus d'informations <i class="	fa fa-google-plus-square"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><%out.println(request.getAttribute("nbrMSGattente")); %></h3>

              <p>Nombre des messages en attente </p>
            </div>
            <div class="icon">
              <i class="ion-chatbubble-working"></i>
            </div>
            <a href="#" class="small-box-footer">plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><%out.println(request.getAttribute("nbrMSGrepondu")); %></h3>

              <p>Nombre de message vu </p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
       
      </div>
            <!-- /.row -->
      <!-- Main row -->
      <!-- /.row (main row) -->
 </div>
<div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        
                       <%
                    String tr=(String)session.getAttribute("notif");
                       if(tr!=null){
                   %><span class="glyphicon glyphicon-ok"></span> <%out.print(tr);
                       } else{%>
                    <p> Vous etes entrain de consulter liste message</p>
                 <%} 
                   session.removeAttribute("notif");%>
                        <br />  
                  
                   </div>
                  
 
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             <table id="example1" class="table table-bordered table-striped"  data-toggle="table" data-detail-view="true"  data-detail-formatter="detailFormatter" >
                <thead>
             <tr>
               <th> </th>
              <th class="select-filter">Type Message</th>
              <th class="select-filter">Etat</th>
             <th class="select-filter">Date</th>
              
                          <th>Adresse Emmeteur</th>
                        
                          <th>Adresse recepteur</th>
                          <th>Objet</th>
                          
                          <th class="select-filter">type</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
                <th> </th>
                 <th class="select-filter">Type Message</th>
               <th class="select-filter">Etat</th>
               <th class="select-filter">Date</th>
              <th>Adresse Emmeteur</th>
                        
                          <th>Adresse recepteur</th>
                          <th>Objet</th>
                          
                          <th class="select-filter">type</th>
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
					
					if(((Message)messages.get(i)).getEtat().equals("ca")){out.println("<td> recu</td>");}
					else if (((Message)messages.get(i)).getEtat().equals("ac")){out.println("<td> envoyer</td>");}
					
					if(((Message)messages.get(i)).getValide()==0){out.println("<td> en attente</td>");}
					else if (((Message)messages.get(i)).getValide()==1){out.println("<td> Deja repondre</td>");}
					else{out.println("<td> Deja vue</td>");}

					
					out.println("<td> " + ((Message)messages.get(i)).getDate()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getAdrEmeteur()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getAdrRecepteur()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getObjet()+ "</td>");
					
				
				
					
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getType() + "</td>");%>
				
					<td> 
				<% 
				if((((Message)messages.get(i)).getValide()==0)&&(((Message)messages.get(i)).getEtat()).equals("ca")){%><a  class='btn btn-info btn-sm' data-toggle='modal' onclick="Contact('<% out.print(((Message)messages.get(i)).getId());%>','<% out.print(((Message)messages.get(i)).getUtilisateur().getCin());%>')"><span class='glyphicon glyphicon-pencil'></span>Repondre</a><%
			
								                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         			
	out.println(" <a class='btn btn-danger btn-sm'  onclick='supprimer("+((Message)messages.get(i)).getId()+")'     ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a> ");
				out.println(" <a class='btn btn-info btn-sm'  onclick='vu("+((Message)messages.get(i)).getId()+")'     ><span class='glyphicon glyphicon-ok'></span>  Vu</a> ");}
				else{                                                                                                                                                                                                                                                                                                                                                                                                             			
					out.println(" <a class='btn btn-danger btn-sm'  onclick='supprimer("+((Message)messages.get(i)).getId()+")'     ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a> ");}
				       
				     %> 
				     </td>
				       
					
					  					<%
				
					  					out.println("</tr>");
					  					%>
					  					

					  			
					  					<%
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
        
           <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Traitement de supprission </h4>
      </div>
      <div class="modal-body">
   
<form  method="post"   action="SupprimerMessage"  name="userrrForm" novalidate>
  <input type="hidden" id="idmessage" name="idmessage" class="form-control" >
   <center>  <img src="dist/img/Supprimer.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment supprimer ce message !</a></center>
      <div class="modal-footer">
     <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>supprimer</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
      
        
        </form>
</div>
  </div></div></div></div>  
 <!-- ajouter des message -->
 <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-info-sign"></span> Traitez le message.</h4>
                    </div>
                    <form action="RepondreMessageAdmin" method="post" accept-charset="utf-8">
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
  <input type="text" id="ContenuMessage" name="ContenuMessage" class="form-control" >
  

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
 
        
        </form>
</div>
  </div></div></div></div>  
 <!-- vu -->
     <div class="modal fade" id="vu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">voila le message </h4>
      </div>
      <div class="modal-body">
   
<form  method="post"   action="Vu"  name="userrrForm" novalidate>
  <input type="hidden" id="idmv" name="idmv" class="form-control" >
   <center>  <img src="img/vu.jpg"  alt="User Image"></center>
<center> <a>vous �tes sur de voir ce message !</a></center>
      <div class="modal-footer">
         <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>Vu</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
      
        
        </form>
</div>
  </div></div></div></div>  
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
                <th >Cin</th>
                          <th>Nom Prenom</th>
                          
                          <th>Gmail</th>
                          <th>Objet</th>
                          
                          <th class="select-filter">type</th>
                          
                         
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
                          
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
ArrayList<Message> mess =(ArrayList<Message>)request.getAttribute("listmessage");
			if (mess != null) {
			
				for (int i = 0; i < messages.size(); i++) 
				{%>
					<tr>
					<%
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					
					out.println("<td> " + df.format(((Message)mess.get(i)).getDate())+ "</td>");
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getCin()+ "</td>");
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getNom() +" "+ ((Message)messages.get(i)).getUtilisateur().getPrenom() +  "</td>");
				
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getMail()+ "</td>");
					
					out.println("<td> " + ((Message)mess.get(i)).getObjet()+ "</td>");
					
				
				
					
					out.println("<td> " + ((Message)mess.get(i)).getUtilisateur().getType() + "</td>");
			
				       
					
					  				
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
  function ListeMessage(){

	  $("#listemessage").modal();
	
	  
  } 
   function Detail(message){
    	  $("#ContenuMessage").val(message);
    	  $("#myModal5").modal();
    	
    	  
      } </script>   

  <script> function supprimer(idmessage){
    	  $("#idmessage").val(idmessage);
    	  $("#myModal4").modal();
    	
    	  
      } </script>
 <script type="text/javascript">
 function ListeInscription(){

	  $("#myModal3").modal();
	
	  
 }  
 function Contact(idmess,cin){
	 $("#cin").val(cin);

	 $("#idmess").val(idmess);
	  $("#contact").modal();
     }
	
 function vu(idmv){
	 $("#idmv").val(idmv);
	  $("#vu").modal();
     }
      </script>
   <script>
          angular.module('myApp', [])
          .controller('AppController', [function() {
            
      }]);
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




<!-- 
  <script type="text/javascript">
	function toggleSibling(sibling){
		sibling = sibling.nextSibling;
		while(!/tr/i.test(sibling.nodeName)){
			sibling = sibling.nextSibling;
		}
		sibling.style.display = sibling.style.display == 'table-row' ? 'none' : 'table-row';
	}
	</script>
	 -->
</body>
</html>
