 <%@include file="../../MenuAdminV3.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><style>

 td.details-control {
    background: url('http://www.datatables.net/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('http://www.datatables.net/examples/resources/details_close.png') no-repeat center center;
}

</style></head>

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
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3> </h3>

              <p> </p>
            </div>
            <div class="icon">
              <i class="ion-android-bulb"><%out.println(request.getAttribute("nbrC")); %></i>
            </div>
            <a onclick="Ajouter()" class="small-box-footer">Nombre des categorie <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
                  </div>
        <!-- ./col -->
          <button type="submit" onclick="Ajouter()"   value="Submit"  class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-plus-sign">Ajouter nouveau categorie</span></button>
        
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <!-- /.row (main row) -->


           
         
         </div>

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="display" cellspacing="0" width="100%" >
                <thead>
             <tr>
             <th> </th>
                 <th>Nom categorie</th>
                  <th>Designation</th>
                
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
              <th> </th>
                 <th>Nom categorie</th>
                  <th>Designation</th>
                
                          <th class="datatable-nosort">action</th>
                         
                </tr>
        </tfoot><tbody>
        
            
           
          
           
        <%
ArrayList<Categorie> categories =(ArrayList<Categorie>)request.getAttribute("list");
			if (categories != null) {
				
				for (int i = 0; i < categories.size(); i++) 
				{%>
				<tr data-key-1="Value 1" data-key-2="kkkk">
				<%
				out.println( "<td class='details-control'></td>");
				
					out.println("<td> " + ((Categorie) categories.get(i)).getNom()+ "</td>");
					out.println("<td> " + ((Categorie) categories.get(i)).getLibelle()+ "</td>");
					
					out.print("<td> <a  class='btn btn-info btn-lg' data-toggle='modal' onclick='AjouterProduit("+((Categorie)categories.get(i)).getId()+")'>Ajouter Produit<span class='glyphicon glyphicon-plus'></span></a>");
					out.println(" <a class='btn btn-danger btn-lg' href='SupprimerCategorie?idcat="+((Categorie) categories.get(i)).getId()+"'  onclick='return confirm(\"Voulez vous vraiment supprimer cet Categorie ?\")'      ><span class='glyphicon glyphicon-trash'></span>  Supprimer</a>  ");
					out.print("<a class='btn btn-warning btn-lg' data-toggle='modal' onclick='AjouterPromotion("+((Categorie)categories.get(i)).getId()+")'>Ajouter Promotion<span class='glyphicon glyphicon-usd'></span></a>");
					%> 
					    
					       
						</td></tr><%
						  					
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
  
  <footer class="main-footer" ng-app="" >
  
  <!-- model 2 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >Ajouter des produits</h4>
      </div>
      <div class="modal-body"> 
        
<form  action="AjouterProduitCategorie" method="post"   name="userrForm"  ng-submit="ctrl.submit()">
    <input type="hidden" id="idc" name="idc" class="form-control" >
 <div class="form-group" ng-class="{ 'has-error' : userrForm.nomp.$invalid && !userrForm.nomp.$pristine }">
            <label>Nom Produit * :</label>
            <input type="text" id="nomp" name="nomp" class="form-control" ng-model="user.nomp" ng-minlength="3" ng-maxlength="8" required>
            
            <p ng-show="userrForm.nomp.$error.minlength" class="help-block">nom est trop court.</p>
            <p ng-show="userrForm.nomp.$error.maxlength" class="help-block">nom est trop long.</p>
            <p ng-show="submitted && userrForm.nomp.$error.required">Required</p>
        </div>
         <div class="form-group" ng-class="{ 'has-error' : userrForm.lib.$invalid && !userrForm.lib.$pristine }">
            <label>Libelle * :</label>
            <input id="lib" type="text" name="lib" class="form-control" ng-model="user.lib" ng-minlength="3" ng-maxlength="100" required>
            
            <p ng-show="userrForm.lib.$error.minlength" class="help-block">Libelle est trop court.</p>
            <p ng-show="userrForm.lib.$error.maxlength" class="help-block">Libelle est trop long.</p>
        
        </div>
  <div class="form-group" ng-class="{ 'has-error' : userrForm.qt.$invalid && !userrForm.qt.$pristine }">
            <label>Quantité * :</label>
            <input id="qt" type="number" name="qt" class="form-control" ng-model="user.qt" min="0" max="10000" required>
            
            <p ng-show="userrForm.qt.$error.min" class="help-block">qte invalid.</p>
            <p ng-show="userrForm.qt.$error.max" class="help-block">qte invalid.</p>
        
        </div>
        <div class="form-group" ng-class="{ 'has-error' : userrForm.prix.$invalid && !userrForm.prix.$pristine }">
            <label>Prix * :</label>
            <input id="prix" type="number" name="prix" class="form-control" ng-model="user.prix" min="0" max="10000" required>
            
            <p ng-show="userrForm.prix.$error.min" class="help-block">prix invalid.</p>
            <p ng-show="userrForm.prix.$error.max" class="help-block">prix invalid.</p>
        
        </div>
        <div class="form-group" ng-class="{ 'has-error' : userrForm.img.$invalid && !userrForm.img.$pristine }">
            <label>Image * :</label>
            <input id="img" type="file" name="img" class="form-control" ng-model="user.img"  required>
            
        
            
        
        </div>
        
      <div class="modal-footer">
  <button type="submit"    value="Submit"  class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Ajouter</span></button>
  <button type="button" data-dismiss="modal" class="btn btn-default btn-lg btn-block"><span class="glyphicon glyphicon-remove">Annuler</span></button>
       
        </form>
</div>
  </div></div></div></div>  
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Categorie </h4>
      </div>
      <div class="modal-body" ng-controller="AppController as ctrl">
        
<form  action="AjouterCategorie" method="post"  name="userForm" ng-submit="ctrl.submit()" >
  
 <div class="form-group" ng-class="{ 'has-error' : userForm.nom.$invalid && !userForm.nom.$pristine }">
            <label>Nom * :</label>
            <input type="text" id="nom" name="nom" class="form-control" ng-model="user.nom" ng-minlength="3" ng-maxlength="30" required>
            
            <p ng-show="userForm.nom.$error.minlength" class="help-block">nom est trop court.</p>
            <p ng-show="userForm.nom.$error.maxlength" class="help-block">nom est trop long.</p>
            
        </div>
         <div class="form-group" ng-class="{ 'has-error' : userForm.Designiation.$invalid && !userForm.Designiation.$pristine }">
            <label>Designation * :</label>
            <input id="Designiation" type="text" name="Designiation" class="form-control" ng-model="user.Designiation" ng-minlength="3" ng-maxlength="20" required>
            
            <p ng-show="userForm.Designiation.$error.minlength" class="help-block">Designiation est trop court.</p>
            <p ng-show="userForm.Designiation.$error.maxlength" class="help-block">Designiation est trop long.</p>
        
        </div>
  
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
        <button type="submit"    value="Submit" ng-disabled="userForm.$invalid"  class="btn btn-info"  >CONFIRMER</button><br>
         Voullez-Vous appuyer sur CONFIRMER  pour valider la processus.<br><br>
        </form>
</div>
  </div></div></div></div>  
  
  <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Categorie </h4>
      </div>
      <div class="modal-body">
        
<form  action="AjouterPromotionCategorie" method="post"  name="userrrForm"   ng-submit="ctrl.submit()" >
  
 <div class="form-group" ng-class="{ 'has-error' : userrrForm.prom.$invalid && !userrrForm.prom.$pristine }">
 <input type="hidden" id="idcat" name="idcat" class="form-control" >
            <label>Ajouter percentage promotion * :</label>
            <input type="number" id="prom"  placeholder="Pourcentage %"  name="prom" class="form-control" ng-model="userrr.prom" min="0" max="100" required>
            
            <p ng-show="userrrForm.prom.$error.min" class="help-block">pourcentage promotion.</p>
            <p ng-show="userrrForm.prom.$error.max" class="help-block">pourcentage promotion.</p>
            
        </div>
       
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
        <button type="submit"    value="Submit" ng-disabled="userrrForm.$invalid"  class="btn btn-info" >CONFIRMER</button><br>
         Voullez-Vous appuyer sur CONFIRMER  pour valider la processus.<br><br>
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
function ListeInscription(){

	  $("#ins").modal();
	
	  
}  
</script>
 <!-- model 2 -->
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
    <script>
          angular.module('myApp', [])
          .controller('AppController', [function() {
            
      }]);
  </script>
  <script>
  function ListeMessage(){

	  $("#listemessage").modal();
	
	  
  } </script>
    </footer>



 <script type="text/javascript">

      
  
  
      
      function Ajouter(){

    	  $("#myModal1").modal();
    	
    	  
      }  
      function AjouterProduit(idc){
    	  $("#idc").val(idc);
    	  $("#myModal2").modal();
    	
    	  
      } 
      function AjouterPromotion(idc){
    	  $("#idcat").val(idc);
    	  $("#myModal3").modal();
    	
    	  
      } 
   
      </script>
<script>
function format ( dataSource ) {
    var html = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
    
    for (var key in dataSource){
        html += '<tr>'+
                   '<td> <a>bbb</a></td>'+
                   '<td> <a onclick="Ajouter()" class="small-box-footer">Ajouter Nouvelle utilisateur <i class="fa fa-arrow-circle-right"></i></a></td>'+
                '</tr>';
    }        
    return html += '</table>';  
}

$(function () {

      var table = $('#example1').DataTable({});

      // Add event listener for opening and closing details
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

</body>
</html>
