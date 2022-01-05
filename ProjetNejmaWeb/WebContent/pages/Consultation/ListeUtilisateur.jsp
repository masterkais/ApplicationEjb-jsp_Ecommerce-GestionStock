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
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
         <div class="box">

      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><%out.println(request.getAttribute("nbrClientA")); %></h3>

              <p>utilisateurs active</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>23</h3>

              <p>Nombre voyeurs  </p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%out.println(request.getAttribute("nbrClientInscrit")); %></h3>

              <p>Nombre des inscription</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
        
        </div>
        <!-- ./col -->
          <button type="submit" onclick="Ajouter()"   value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Ajouter nouveau utilisateur</span></button>
        
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
                    <p> Vous etes entrain de consulter liste utilisateur</p>
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
              <table id="example1" class="table table-bordered table-striped" >
                <thead>
             <tr>
                 <th class="select-filter">cin</th>
                          <th>Nom</th>
                          <th>Prenom</th>
                          <th>Date naissance</th>
                          <th>login</th>
                          <th>password</th>
                           <th>Adresse</th>
                           <th>Email</th>
                           <th>Tel</th>
                          
                          <th class="select-filter">type</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
                 <th class="select-filter">cin</th>
                          <th>Nom</th>
                          <th>Prenom</th>
                          <th>Date naissance</th>
                          <th>login</th>
                          <th>password</th>
                           <th>Adresse</th>
                           <th>Email</th>
                           <th>Tel</th>
                          
                          <th class="select-filter">type</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
ArrayList<Utilisateur> users =(ArrayList<Utilisateur>)request.getAttribute("list");
			if (users != null) {
			
				for (int i = 0; i < users.size(); i++) 
				{%>
					<tr>
					<%
					out.println("<td> " + ((Utilisateur)users.get(i)).getCin()+ "</td>");
					out.println("<td> " + ((Utilisateur)users.get(i)).getNom() + "</td>");
					out.println("<td> " + ((Utilisateur)users.get(i)).getPrenom() + "</td>");
					SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					
					out.println("<td> " + df.format(((Utilisateur)users.get(i)).getDatens())+ "</td>");
				
					
					out.println("<td> " + ((Utilisateur)users.get(i)).getLogin() + "</td>");
					out.println("<td> " + ((Utilisateur)users.get(i)).getPassword() + "</td>");
					out.println("<td> " + ((Utilisateur)users.get(i)).getAdresse() + "</td>");
					out.println("<td> " + ((Utilisateur)users.get(i)).getMail() + "</td>");
					out.println("<td> " + ((Utilisateur)users.get(i)).getTel() + "</td>");
					
					out.println("<td> " + ((Utilisateur)users.get(i)).getType() + "</td>");%>
	<td>  <a class='btn btn-warning btn-sm' onclick="Modifier('<% out.print(((Utilisateur) users.get(i)).getCin());%>','<% out.print(((Utilisateur) users.get(i)).getNom());%>','<% out.print(((Utilisateur) users.get(i)).getPrenom());%>','<% out.print(df.format(((Utilisateur)users.get(i)).getDatens()));%>','<% out.print(((Utilisateur) users.get(i)).getType());%>','<% out.print(((Utilisateur) users.get(i)).getLogin());%>','<% out.print(((Utilisateur) users.get(i)).getPassword());%>','<% out.print(((Utilisateur) users.get(i)).getMail());%>','<% out.print(((Utilisateur) users.get(i)).getTel());%>','<% out.print(((Utilisateur) users.get(i)).getAdresse());%>')"><span class='glyphicon glyphicon-pencil'></span>  Modifier</a> <%
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         			
	out.println(" <a class='btn btn-danger btn-sm'  href ='SupprimerUser?id="+((Utilisateur)users.get(i)).getCin()+"'  onclick='return confirm(\"Voulez vous vraiment supprimer cet utilisateur ?\")'      ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a> ");
	out.println(" <a class='btn btn-info'  onclick='Contact("+((Utilisateur)users.get(i)).getCin()+")'    ><span class='glyphicon glyphicon-envelope'></span>  Contacter</a> ");
				       
				     %> 
				     </td>
				       
					
					  					<%
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

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Profil Utilisateur </h4>
      </div>
      <div class="modal-body" ng-controller="AppController as ctrl" >
        
<form  action="AjouterUser" method="post"  ng-submit="ctrl.submit()" name="userForm" >
   <div class="form-group" ng-class="{ 'has-error' :userForm.cin.$invalid && !userForm.cin.$pristine }">
            <label for="nm">N° Cin* :</label>
            <input type="number" id="c11" name="cin" class="form-control" ng-model="user.cin" required ng-minlength="8" ng-maxlength="8" min="10000000" max="99999999">
            <p ng-show="userForm.cin.$error.minlength" class="help-block">Cin est incorrect.</p>
            <p ng-show="userForm.cin.$error.maxlength" class="help-block">Cin est incorrect.</p>
            <p ng-show="userForm.cin.$error.min">Minimum length required is 8</p>
             <p ng-show="submitted && userForm.cin.$error.required">Required</p>
                                       <p ng-show="userForm.cin.$error.max">Minimum length required is 8</p>
        </div>
 <div class="form-group" ng-class="{ 'has-error' : userForm.nom.$invalid && !userForm.nom.$pristine }">
            <label>Nom * :</label>
            <input type="text" id="c22" name="nom" class="form-control" ng-model="user.nom" ng-minlength="3" ng-maxlength="8" required>
            
            <p ng-show="userForm.nom.$error.minlength" class="help-block">nom est trop court.</p>
            <p ng-show="userForm.nom.$error.maxlength" class="help-block">nom est trop long.</p>
            
        </div>
         <div class="form-group" ng-class="{ 'has-error' : userForm.prenom.$invalid && !userForm.prenom.$pristine }">
            <label>Prenom * :</label>
            <input id="c33" type="text" name="prenom" class="form-control" ng-model="user.prenom" ng-minlength="3" ng-maxlength="8" required>
            
            <p ng-show="userForm.prenom.$error.minlength" class="help-block">prenom est trop court.</p>
            <p ng-show="userForm.prenom.$error.maxlength" class="help-block">prenom est trop long.</p>
        
        </div>
   <div class="form-group" ng-class="{ 'has-error' : userForm.type.$invalid && !userForm.type.$pristine }">   
    <label for="nm" >Type :</label>
    <select id="c100" name="type" class="form-control"  ng-model="user.type" required>
    <option></option>
    <option>admin</option>
    <option>secretaire</option>
    <option>magasinier</option>
    <option>client</option>    
    </select>
      <p ng-show="userForm.type.$error.minlength" class="help-block">Choisir le type.</p>
          
    </div>
    <div class="form-group" ng-class="{ 'has-error' : userForm.daten.$invalid && !userForm.daten.$pristine }">
       <label for="nm">Date naissance :</label>
    <input id="c44" type="Date" placeholder="YYYY-MM-DD" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" class="form-control" id="daten" name="daten" ng-model="user.daten" required >
    </div>
     <center> <button type="button" class="btn btn-warning" data-toggle="collapse" data-target="#demo"><span class="glyphicon glyphicon-hand-down"></span></button></center>
    
         <div id="demo" class="collapse">
        <div class="form-group" ng-class="{ 'has-error' : userForm.adresse.$invalid && !userForm.adresse.$pristine }">
            <label for="nm">N° Adresse* :</label>
            <input type="text" id="c77" name="adresse" ng-model="user.adresse"  class="form-control" ng-minlength="3" ng-maxlength="8" required>
            <p ng-show="userForm.adresse.$error.minlength" class="help-block">Adresse manquante.</p>
            <p ng-show="userForm.adresse.$error.maxlength" class="help-block">Adresse est trop long. </p>
        </div>
           <div class="form-group" ng-class="{ 'has-error' : userForm.mail.$invalid && !userForm.mail.$pristine }">
            <label for="nm">Email * :</label>
            <input type="email" id="c88" name="mail" class="form-control" ng-model="user.mail"   required>
            <p ng-show="userForm.mail.$error.required" class="help-block">Email is required.</p>
            <p ng-show="userForm.mail.$error.mail" class="help-block">Email icorrect.</p>
           
        </div>
    <div class="form-group" ng-class="{ 'has-error' : userForm.tel.$invalid && !userForm.tel.$pristine }">
            <label for="nm">Telphone * :</label>
            <input type="number" id="c99" name="tel" class="form-control" ng-model="user.tel"  ng-minlength="8" ng-maxlength="8" required min="10000000" max="99999999">
            <p ng-show="userForm.tel.$error.minlength" class="help-block">Telephone incorrecte.</p>
            <p ng-show="userForm.tel.$error.maxlength" class="help-block">Telephone incorrecte.</p>
        </div>
         <div class="form-group" ng-class="{ 'has-error' : userForm.login.$invalid && !userForm.login.$pristine }">
            <label for="nm">Login * :</label>
            <input type="text" id="c55" name="login" class="form-control" ng-model="user.login"  ng-minlength="3" ng-maxlength="8" required>
            <p ng-show="userForm.login.$error.minlength" class="help-block">Login est trop court.</p>
            <p ng-show="userForm.login.$error.maxlength" class="help-block">login est trop long.</p>
        </div>
        <div class="form-group" ng-class="{ 'has-error' : userForm.password.$invalid && !userForm.password.$pristine }">
            <label for="nm">Password * :</label>
            <input type="text" id="c66" name="password" class="form-control" ng-model="user.password"  ng-minlength="6" ng-maxlength="8" required>
            <p ng-show="userForm.password.$error.minlength" class="help-block">Password trop court.</p>
            <p ng-show="userForm.password.$error.maxlength" class="help-block">Password trop long.</p>
           
        </div>
     </div>
          <div class="modal-footer">
            <button type="submit"    value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Ajouter</span></button>
  <button type="button" data-dismiss="modal" class="btn btn-default btn-lg btn-block"><span class="glyphicon glyphicon-remove">Annuler</span></button>
      </form>
</div>
  </div></div></div></div>  
<!-- model 2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Profil Utilisateur </h4>
      </div>
      <div class="modal-body" ng-controller="AppController as ctrl" >
        
<form  action="ModifierUser" method="post"  ng-submit="ctrl.submit()" name="userForm" >
   <div class="form-group" ng-class="{ 'has-error' :userForm.cin.$invalid && !userForm.cin.$pristine }">
            <label for="nm">N° Cin* :</label>
            <input type="number" id="c1" name="cin" class="form-control" ng-model="user.cin" required ng-minlength="8" ng-maxlength="8" min="10000000" max="99999999">
            <p ng-show="userForm.cin.$error.minlength" class="help-block">Cin est incorrect.</p>
            <p ng-show="userForm.cin.$error.maxlength" class="help-block">Cin est incorrect.</p>
            <p ng-show="userForm.cin.$error.min">Minimum length required is 8</p>
             <p ng-show="submitted && userForm.cin.$error.required">Required</p>
                                       <p ng-show="userForm.cin.$error.max">Minimum length required is 8</p>
        </div>
 <div class="form-group" ng-class="{ 'has-error' : userForm.nom.$invalid && !userForm.nom.$pristine }">
            <label>Nom * :</label>
            <input type="text" id="c2" name="nom" class="form-control" ng-model="user.nom" ng-minlength="3" ng-maxlength="8" required>
            
            <p ng-show="userForm.nom.$error.minlength" class="help-block">nom est trop court.</p>
            <p ng-show="userForm.nom.$error.maxlength" class="help-block">nom est trop long.</p>
            
        </div>
         <div class="form-group" ng-class="{ 'has-error' : userForm.prenom.$invalid && !userForm.prenom.$pristine }">
            <label>Prenom * :</label>
            <input id="c3" type="text" name="prenom" class="form-control" ng-model="user.prenom" ng-minlength="3" ng-maxlength="8" required>
            
            <p ng-show="userForm.prenom.$error.minlength" class="help-block">prenom est trop court.</p>
            <p ng-show="userForm.prenom.$error.maxlength" class="help-block">prenom est trop long.</p>
        
        </div>
   <div class="form-group" ng-class="{ 'has-error' : userForm.type.$invalid && !userForm.type.$pristine }">   
    <label for="nm" >Type :</label>
    <select id="c10" name="type" class="form-control"  ng-model="user.type" required>
    <option></option>
    <option>Admin</option>
    <option>Secretaire</option>
    <option>Magasinier</option>
    <option>Client</option>    
    </select>
      <p ng-show="userForm.type.$error.minlength" class="help-block">Choisir le type.</p>
          
    </div>
    <div class="form-group" ng-class="{ 'has-error' : userForm.daten.$invalid && !userForm.daten.$pristine }">
       <label for="nm">Date naissance :</label>
    <input id="c4" type="text" placeholder="YYYY-MM-DD" required pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" class="form-control" id="daten" name="daten" ng-model="user.daten" required >
    </div>
    
       
        <div class="form-group" ng-class="{ 'has-error' : userForm.adresse.$invalid && !userForm.adresse.$pristine }">
            <label for="nm">N° Adresse* :</label>
            <input type="text" id="c7" name="adresse" ng-model="user.adresse"  class="form-control" ng-minlength="3" ng-maxlength="8" required>
            <p ng-show="userForm.adresse.$error.minlength" class="help-block">Adresse manquante.</p>
            <p ng-show="userForm.adresse.$error.maxlength" class="help-block">Adresse est trop long. </p>
        </div>
           <div class="form-group" ng-class="{ 'has-error' : userForm.mail.$invalid && !userForm.mail.$pristine }">
            <label for="nm">Email * :</label>
            <input type="email" id="c8" name="mail" class="form-control" ng-model="user.mail"   required>
            <p ng-show="userForm.mail.$error.required" class="help-block">Email is required.</p>
            <p ng-show="userForm.mail.$error.mail" class="help-block">Email icorrect.</p>
           
        </div>
    <div class="form-group" ng-class="{ 'has-error' : userForm.tel.$invalid && !userForm.tel.$pristine }">
            <label for="nm">Telphone * :</label>
            <input type="number" id="c9" name="tel" class="form-control" ng-model="user.tel"  ng-minlength="8" ng-maxlength="8" required min="10000000" max="99999999">
            <p ng-show="userForm.tel.$error.minlength" class="help-block">Telephone incorrecte.</p>
            <p ng-show="userForm.tel.$error.maxlength" class="help-block">Telephone incorrecte.</p>
        </div>
         <div class="form-group" ng-class="{ 'has-error' : userForm.login.$invalid && !userForm.login.$pristine }">
            <label for="nm">Login * :</label>
            <input type="text" id="c5" name="login" class="form-control" ng-model="user.login"  ng-minlength="3" ng-maxlength="8" required>
            <p ng-show="userForm.login.$error.minlength" class="help-block">Login est trop court.</p>
            <p ng-show="userForm.login.$error.maxlength" class="help-block">login est trop long.</p>
        </div>
        <div class="form-group" ng-class="{ 'has-error' : userForm.password.$invalid && !userForm.password.$pristine }">
            <label for="nm">Password * :</label>
            <input type="text" id="c6" name="password" class="form-control" ng-model="user.password"  ng-minlength="6" ng-maxlength="8" required>
            <p ng-show="userForm.password.$error.minlength" class="help-block">Password trop court.</p>
            <p ng-show="userForm.password.$error.maxlength" class="help-block">Password trop long.</p>
           
        </div>
     
          <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
     <input type="submit"    value="Submit" ></br>  Voullez-Vous appuyer sur CONFIRMER  pour valider la processus.<br><br>
        </form>
</div>
  </div></div></div></div> 
  
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

 <!-- Liste inscription --> 
<!-- model 4 -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                         
                         
                          <th>Nom Prenom</th>
                       
                           <th>Login</th>
                          <th>Tel</th>
                           
                           <th>Gmail</th>
                     
                         <th>Action</th>
                          </tr>
                          </thead>
                          <tbody>
 
<%
ArrayList<Utilisateur> listClientFidele =(ArrayList<Utilisateur>)request.getAttribute("ListeClientFidele");
			if (listClientFidele != null) {
				
				for (int i = 0; i < listClientFidele.size(); i++) 
				{
					out.println("<tr>");
					
					out.println("<td> " + ((Utilisateur) listClientFidele.get(i)).getNom() +" et "+ ((Utilisateur) listClientFidele.get(i)).getPrenom() +  "</td>");
					
					out.println("<td> " + ((Utilisateur) listClientFidele.get(i)).getLogin() + "</td>");
					
					out.println("<td> " + ((Utilisateur) listClientFidele.get(i)).getTel() + "</td>");
					out.println("<td> " + ((Utilisateur) listClientFidele.get(i)).getMail() + "</td>");
					
					
					out.print("<td>  <a class='btn btn-warning btn-sm' onclick='AjouterPoint("+((Utilisateur) listClientFidele.get(i)).getCin()+")'   ><span class='glyphicon glyphicon-ok-sign'></span>  Ajouter des points</a> ");
					out.print("<td>  <a class='btn btn-warning btn-sm'  onclick='VoirCommandes("+((Utilisateur) listClientFidele.get(i)).getCin()+")' ><span class='glyphicon glyphicon-ok-sign'></span>  Voir commandes</a> ");
					out.println(" <a class='btn btn-danger btn-sm'   onclick='Contact("+((Utilisateur) listClientFidele.get(i)).getCin()+")' ><span class='glyphicon glyphicon-trash'></span>  Contater</a></td> ");
				                                 
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
<!-- ajouter des point -->
 <div class="modal fade" id="contact" tabindex="-1" role="dialog" aria-labelledby="contactLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="panel-title" id="contactLabel"><span class="glyphicon glyphicon-info-sign"></span> Traitez le message.</h4>
                    </div>
                    <form action="AjouterMessage" method="post" accept-charset="utf-8">
                    <div class="modal-body" style="padding: 5px;">
                          <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                
                                    <input class="form-control" id="cin" name="cin" placeholder="cin" type="hidden" required autofocus />
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 10px;">
                                    <input type="hidden" name="emeteur" placeholder="Lastname"  />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">
                                    <input class="form-control" name="email" placeholder="E-mail" type="hidden" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-bottom: 10px;">
                                    <input class="form-control" name="objet" placeholder="objet" type="text" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <input style="resize:vertical;" class="form-control" placeholder="Message..." rows="6" name="message" id="message" required>
                                </div>
                            </div>
                        </div>  
                        <div class="panel-footer" style="margin-bottom:-14px;">
                            <input type="submit" class="btn btn-success" value="Send"/>
                                <!--<span class="glyphicon glyphicon-ok"></span>-->
                            <input type="reset" class="btn btn-danger" value="Clear" />
                                <!--<span class="glyphicon glyphicon-remove"></span>-->
                            <button style="float: right;" type="button" class="btn btn-default btn-close" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
ArrayList<Message> messages =(ArrayList<Message>)request.getAttribute("listmessage");
			if (messages != null) {
			
				for (int i = 0; i < messages.size(); i++) 
				{%>
					<tr>
					<%
SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
					
					out.println("<td> " + df.format(((Message)messages.get(i)).getDate())+ "</td>");
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getCin()+ "</td>");
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getNom() +" "+ ((Message)messages.get(i)).getUtilisateur().getPrenom() +  "</td>");
				
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getMail()+ "</td>");
					
					out.println("<td> " + ((Message)messages.get(i)).getObjet()+ "</td>");
					
				
				
					
					out.println("<td> " + ((Message)messages.get(i)).getUtilisateur().getType() + "</td>");
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
