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



    <!-- Main content -->
    <section class="content">
      <div class="row">
             <%
                    String tr=(String)session.getAttribute("notif");
                       if(tr!=null){
                   %>
        <div class="col-xs-12">
         
    <div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        
                <span class="glyphicon glyphicon-ok"></span> <%out.print(tr);
                       } %>
                   
               
                        <br />  
                  
                   </div>  <%
                       session.removeAttribute("notif");
                       %>
          <div class="box">
            <div class="box-header">
              
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                                 
                        
            <section>
            <style>
body {
	background: #e6e6e6;
}

.control-group {
	display: inline-block;
	width: 200px;
	height: 210px;
	margin: 10px;
	padding: 30px;
	text-align: left;
	vertical-align: top;
	background: #fff;
	box-shadow: 0 1px 2px rgba(0,0,0,.1);
}
.control {
	font-size: 18px;
	position: relative;
	display: block;
	margin-bottom: 15px;
	padding-left: 30px;
	cursor: pointer;
}

.control input {
	position: absolute;
	z-index: -1;
	opacity: 0;
}
.control__indicator {
	position: absolute;
	top: 2px;
	left: 0;
	width: 20px;
	height: 20px;
	background: #e6e6e6;
}

.control--radio .control__indicator {
	border-radius: 50%;
}
/* Hover and focus states */
.control:hover input ~ .control__indicator,
.control input:focus ~ .control__indicator {
	background: #ccc;
}

/* Checked state */
.control input:checked ~ .control__indicator {
	background: #2aa1c0;
}
/* Hover and focus states */
.control:hover input ~ .control__indicator,
.control input:focus ~ .control__indicator {
	background: #ccc;
}

/* Checked state */
.control input:checked ~ .control__indicator {
	background: #2aa1c0;
}

/* Hover state whilst checked */
.control:hover input:not([disabled]):checked ~ .control__indicator,
.control input:checked:focus ~ .control__indicator {
	background: #0e647d;
}

/* Disabled state */
.control input:disabled ~ .control__indicator {
	pointer-events: none;
	opacity: .6;
	background: #e6e6e6;
}

/* Check mark */
.control__indicator:after {
	position: absolute;
	display: none;
	content: '';
}

/* Show check mark */
.control input:checked ~ .control__indicator:after {
	display: block;
}

/* Checkbox tick */
.control--checkbox .control__indicator:after {
	top: 4px;
	left: 8px;
	width: 3px;
	height: 8px;
	transform: rotate(45deg);
	border: solid #fff;
	border-width: 0 2px 2px 0;
}

/* Disabled tick colour */
.control--checkbox input:disabled ~ .control__indicator:after {
	border-color: #7b7b7b;
}

/* Radio button inner circle */
.control--radio .control__indicator:after {
	top: 7px;
	left: 7px;
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: #fff;
}

/* Disabled circle colour */
.control--radio input:disabled ~ .control__indicator:after {
	background: #7b7b7b;
}


</style>
		<div class="container">
			<div class="row">
				<div class="col-sm-3 filterList">
					<div class="left-sidebar">
				
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
						
								   <%
              ArrayList<Categorie> cat =(ArrayList<Categorie>)request.getAttribute("listcat");
  			if (cat != null) {
  				
  				for (int i = 0; i < cat.size(); i++) 
  				{%>
							
							<div class="panel panel-default">
								<div class="panel-heading">
								<label class="control control--checkbox"><font color="#4154F4"><%out.print(cat.get(i).getNom()); %></font><font color="#FB0606"><span class="pull-right">(<%out.print(cat.get(i).getProduits().size()); %> )</span></font>
		<input type="checkbox" name="categorie" value="<%out.print(cat.get(i).getNom());%>"/>
		<div class="control__indicator"></div>
	</label>
								
								</div>
							</div>
						<%}} %>	
						</div><!--/category-products-->

						
						<div class="price-range"><!--price-range-->
							<h2>Range par prix</h2>
							<div class="well text-center">
							<!-- 
								 <input type="text" class="span2" value="" data-provide="slider"  data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
 --><span id="price_range_label" style="margin:50px;">$0-$500</span>
            <div id="price_slider"></div>
								 <b class="pull-left">TND 0</b> <b class="pull-right">TND 5000</b>
								 <input type='hidden' id="slidervalue" value=''> 
								
							</div>
						</div><!--/price-range-->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="images/dd.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Liste des produits en promotion</h2>
											   <%
              ArrayList<Produit> prod =(ArrayList<Produit>)request.getAttribute("listProduit");
  			if (prod != null) {
  				
  				for (int i = 0; i < prod.size(); i++) 
  				{%>
						<!-- debut -->
						<div class="prodGrid">	
						<div data-price="<%out.println(prod.get(i).getPrix()); %>" class="col-sm-4 <%   out.println(prod.get(i).getCategorie().getNom()); if(prod.get(i).getPromo()==1){out.println("promotion");}%>">
							<div class="product-image-wrapper">
								<div class="single-products">
										<div class="productinfo text-center">
							<%out.println("<img width='120px' heigth='120px' src='images/"+((Produit) prod.get(i)).getImage()+"'/>");
							out.println("<h2>"+((Produit) prod.get(i)).getPrix()+"<small>TND</small></h2>");
							out.println("<p>"+((Produit) prod.get(i)).getNom()+"</p>");
							if(((Produit) prod.get(i)).getQuantite()!=0){
								out.println("<font color='#3AC41C'><h1> disponible </h1><font>");}
								else{	out.println("<font color='#C41C2E'><h1> pas disponible </h1><font>");}
						
							%>
											
											
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Ajouter au panier</a>
										</div>
										<div class="product-overlay">
											<div class="overlay-content">
							<%
						out.println("<img width='120px' heigth='120px' src='images/"+((Produit) prod.get(i)).getImage()+"'/>");
							out.println("<font color='#000000'><h3>"+((Produit) prod.get(i)).getNom()+"</h3>");
							out.println("<font color='#000000'><h4> Appartient au categorie "+((Produit) prod.get(i)).getCategorie().getNom()+"</h3>");
							out.println("<h2>"+((Produit) prod.get(i)).getPrix()+"<small>TND</small></h2>");
							
							
							%>
							<button onclick="voir('<% out.print(((Produit) prod.get(i)).getId());%>','<% out.print(((Produit) prod.get(i)).getNom());%>','<% out.print(((Produit) prod.get(i)).getLibelle());%>','<% out.print(((Produit) prod.get(i)).getPrix());%>','<% out.print(((Produit) prod.get(i)).getPromo());%>','<% out.print(((Produit) prod.get(i)).getQuantite());%>','<% out.print(((Produit) prod.get(i)).getCategorie().getNom());%>','<% out.print("images/"+((Produit) prod.get(i)).getImage());%>','<% out.print(((Produit) prod.get(i)).getDescription());%>')" class="btn btn-success btn-lg" ><i class="fa fa-search"></i>Voir produit</button>
									
											</div>
										</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<center>
											<button onclick="AjouterProduit('<% out.print(((Produit) prod.get(i)).getId());%>','<% out.print(((Produit) prod.get(i)).getNom());%>')"class="btn btn-danger "><i class="fa fa-shopping-cart"></i></button>
											
											
											<button onclick="FavorieProduit('<% out.print(((Produit) prod.get(i)).getId());%>','<% out.print(((Produit) prod.get(i)).getNom());%>','<% out.print(((Produit) prod.get(i)).getImage());%>')"class="btn btn-warning"><i class="glyphicon glyphicon-heart-empty"></i></button>
											
									</center>
									</ul>
								</div>
							</div>
						</div>
						<!-- fin -->
						<% }}%>
						</div>
						</div>
						
					</div><!--features_items-->
					
				
					
				</div>
			</div>
		</div>
	</section>
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
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center> <h4 class="modal-title">Ajouter Produit au liste favorie</h4></center>
      </div>
      <div class="modal-body">
       
        <form method="post" action="AjouterProduitFavorie1">
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
        
      </div> </div> </div></div></div></div>
   <!-- Modal3 -->
<div class="modal fade" id="myModal44" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center> <h4 class="modal-title">Ajouter Produit au liste favorie</h4></center>
      </div>
      <div class="modal-body">
       
        <form method="post" action="AjouterProduitFavorie1">
  <div class="form-group">
   <input type="hidden"  class="form-control" id="idu" name="idu" value="<%out.print(u.getCin());%>">
 <input type="hidden"  class="form-control" id="idppp" name="idpp">
  <center>  <img src="img/fav.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment ajouter  ce produit au liste favorie !</a></center>


   
     
         
      </div>
      <div class="modal-footer">
         <center>
       
        
        <button type="submit" class="btn btn-primary btn-lg btn-block" ><span class="glyphicon glyphicon-thumbs-up"></span>Ajouter au favorie</button></br>
         <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down"></span>Annuler</button>
        </center>
     
        </form>
        
      </div> </div> </div></div></div></div>
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
       
        <form method="post" action="AjouterPanier2">
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
        
      </div> </div> </div></div></div> </div> </div></div>
      <div class="modal fade" id="myModal33" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <center> <h4 class="modal-title">Ajouter Panier</h4></center>
      </div>
      <div class="modal-body">
       
        <form method="post" action="AjouterPanier1">
  <div class="form-group">
  
 <input type="hidden" id="idp1" name="idp1"   />
  <center>  <img src="img/panier.jpg"  alt="User Image"></center>
<center> <a>Veuillez vouz vraiment ajouter  ce produit au panier !</a></center>
    <label for="nm">saisir la Quantite :</label>
    <input type="number" class="form-control" id="qtdis" name="qtdis"  required  min="0" >

   
     
         
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
        
      </div> </div> </div></div></div> </div></div>
      
        <!-- Modal3 -->
<div class="modal fade" id="voir" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-body" ng-controller="AppController as ctrl" >
<form   ng-submit="ctrl.submit()" name="form" >
 

    <div class="container-fluid">
    <div class="content-wrapper">	
		<div class="item-container">	
			<div class="cities">	
			
					
                    
						<center>
							<img src="#" width='120px' heigth='120px' alt=""  id="img" />
						</center>
					
			
				
					
				<div class="col-md-7">
				
					<div class="product-title" ><input type="hidden"   id="idprod"/><b><i><font color="#8B0000">Nom produit    : </font><label id="nom"></label> </i></b></div>
					<div class="product-title" ><b><i><font color="#8B0000">Categorie    : </font><label id="cat"></label> </i></b></div>
					<div class="product-rating"><i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i> <i class="fa fa-star gold"></i> <i class="fa fa-star-o"></i> </div>
					<div class="product-title" ><b><i><font color="#8B0000">Prix         : </font><label id="prix"></label> TND</i></b></div>
					<div class="product-title"><b><i><font color="#8B0000">Etat : </font><label id="qtte" name="qtte"></label> </i></b></div>
					<div class="product-title"><b><i><font color="#8B0000">promotion     : </font><label id="prommo" name="promo"></label> </i></b></div>
				
					
					<div class="btn-group-vertical">
					<center>
						<button data-dismiss="modal" onclick="AjouterProduit1()" class="btn btn-success btn-lg">
						<span class="glyphicon glyphicon-shopping-cart"></span>	Ajouter Panier
						</button>
				
						<button data-dismiss="modal" onclick="FavorieProduit1()" class="btn btn-danger btn-lg">
							<span class="glyphicon glyphicon-star-empty"></span>Ajouter favori 
						</button>
						</center>
					</div>
				</div>
			</div> 
		</div>
		<div class="container-fluid">		
			<div class="col-md-12 product-info">
					<ul id="myTab" class="nav nav-tabs nav_tabs">
						
						<li ><a href="#service-one" data-toggle="tab">DESCRIPTION</a></li>
						<li><a href="#service-two" data-toggle="tab">PRODUIT INFO</a></li>
						
						
					</ul>
				<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="service-one">
						 
							<section class="container product-info">
<b><i><label id="desc"></label> </i></b>
							</section>
										  
						</div>
					<div class="tab-pane fade" id="service-two">
					
						<section class="container">
							<b><i><label id="info"></label> </i></b>
						</section>
						
					</div>
					<div class="tab-pane fade" id="service-three">
												
					</div>
				</div>
				<hr>
	

     
   
      <div class="modal-footer">
         <center>
   <button type="button" class="btn btn-warning btn-lg btn-block" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>Fermer</button>
        </center>  
      </div></form>      </div></div></div> 
      
          <!-- envoyer message -->
     <!-- voi detail -->
     
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

function voir(id,nom,lib,prix,promo,quantie,nomcat,img,info){
	$("#idprod").val(id);
	 $("#nom").html(nom);
	 $("#prix").html(prix);
	 $("#desc").html(lib);
	 $("#info").html(info);
	 $("#cat").html(nomcat);
	   var x = quantie;
	   var m;
	   if(x.valueOf()>0){ m="disponible";  $("#qtte").html(m);}else{m="n'est pas disponible";  $("#qtte").html(m);}
	   var z = promo;
	   var y;
	   if(z.valueOf()>0){ y="ce produit est en promotion";  $("#prommo").html(y);}else{y="ce produit n'est pas en promotion";  $("#prommo").html(y);}
	 
	 $("#promo").html(promo);
	  
	    //alert(img);
	    $("#img").attr("src", img);
	 $('#voir').modal();
 
}
</script>
 <script type="text/javascript">
       $.cookie.json = true;
       var panier=[];
       
    		   function FavorieProduit(idp,nom,image_p){
    		      	  $("#idpp").val(idp);
    		      	  $("#nomm").text(nom);

    		      	  $('#myModal4').modal();
    		      	
    		      	  
    		        }  
       function AjouterProduit(idp,nom){
      	  $("#idp").val(idp);
      	  $("#nom").text(nom);
     
      	  $('#myModal3').modal();
      	
      	  
        }  

       function FavorieProduit1(){
    	   var x = document.getElementById("idprod").value;
    	   $("#idppp").val(x);
       	  

	      	  $('#myModal44').modal();
	      	
	      	  
	        }  

       function AjouterProduit1(){
    	  
    	

    	   var x = document.getElementById("idprod").value;
    	   $("#idp1").val(x);
    	   var u = document.getElementById("qtte").value;
    	   $("#qtdis").val(u);
       	  $('#myModal33').modal();
       	
       	  
         }   
        

    	     

     
       </script>
  <script>
          angular.module('myApp', [])
          .controller('AppController', [function() {
            
      }]);
  </script>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js">
      </script> 
      
	<script src="tjs/jquery.scrollUp.min.js"></script>
	<script src="tjs/price-range.js"></script>
    <script src="tjs/jquery.prettyPhoto.js"></script>
    <script src="tjs/main.js"></script>
	<script src="tjs/jquery-ui-1.10.2.custom.min.js"></script>
	<script>
	$('input[type="checkbox"]').click(function(){
	    var checkedBoxes = $('input[type="checkbox"]:checked');
	    var listOfClasses = [];
	    checkedBoxes.each(function(index, el){
	        listOfClasses.push(el.value);
	    });
	    if(listOfClasses.length >= 1){
	        $('div.prodGrid').children('div').hide();
	    
	        for(var i = 0; i < listOfClasses.length; i++){
	        	$('div.prodGrid > div.'+listOfClasses[i]).show();
	        }
	    } else {
	        $('div.prodGrid > div').show();
	    }
	});

	

	$(document).ready(function(){
		

		  $('#price_filter').val('0-5000');
		  $("#price_slider").slider({
		    range:true,
		    min: 0,
		    max: 5000,
		    values:[0, 5000],
		    step: 5,
		    slide: function(event, ui) {
		      $("#price_range_label").html('$' + ui.values[ 0 ] + ' - $' + ui.values[ 1 ] );
		      showProducts(ui.values[ 0 ] , ui.values[ 1 ] );
		    }
		  });

	});
   
	 
	function showProducts(minPrice, maxPrice) {
		   $('div.prodGrid').children('div').hide().filter(function() {
		        var price = parseInt($(this).data("price"), 10);
		        return price >= minPrice && price <= maxPrice;
		    }).show();
	
	}
		</script>
</body>
</html>
