<%@page language="java" import="entityBeans.*,java.util.ArrayList,java.util.Iterator,java.text.SimpleDateFormat,java.util.Collection" import="java.util.List" %>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div class="modal fade" id="connex" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
		<a >Login or <a href="#">Sign up</a></a>
			</div> <!-- /.modal-header -->

			<div class="modal-body">
			
				<form role="form" method="post" action="ConnexionAction">
					<div class="form-group">
						<div class="input-group">
							<input type="text" class="form-control" id="uLogin" placeholder="Login" name="login" required>
							<label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
						</div>
					</div> <!-- /.form-group -->

					<div class="form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="uPassword" placeholder="Password" name="password" required>
							<label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
						</div> <!-- /.input-group -->
					</div> <!-- /.form-group -->

					<div class="checkbox">
						<label>
							<input type="checkbox"> <a>Remember me</a>
						</label>
					</div> <!-- /.checkbox -->
				

			</div> <!-- /.modal-body -->

			<div class="modal-footer">
				            <button type="submit"    value="Submit" ng-disabled="userForm.$invalid" class="btn btn-primary btn-lg btn-block"><span class="glyphicon glyphicon-ok">Ajouter</span></button>
  <button type="button" data-dismiss="modal" class="btn btn-default btn-lg btn-block"><span class="glyphicon glyphicon-remove">Annuler</span></button>
   
				</br></br>
		<div class="row omb_row-sm-offset-3 omb_socialButtons">
    	   <div class="col-md-4 row-block">
		        <a href="#" class="btn btn-lg btn-block omb_btn-facebook">
			        <i class="fa fa-facebook visible-xs"></i>
			        <span class="hidden-xs">Facebook</span>
		        </a>
	        </div>
     	
         <div class="col-md-4 row-block">
		        <a href="#" class="btn btn-lg btn-block omb_btn-google">
			        <i class="fa fa-google-plus visible-xs"></i>
			        <span class="hidden-xs">Google+</span>
		        </a>
	        </div>	
		</div>
</form>
				
			</div> <!-- /.modal-footer -->
			
			
</div>
		</div><!-- /.modal-content -->
		
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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
 


  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
   <link rel="stylesheet" href="tcss/jquery-ui-1.10.2.custom.min.css">

  <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <title>Stylish Portfolio - Start Bootstrap Theme</title>
<!-- animation button -->
 <link href='animationButton/an.css' rel='stylesheet' type='text/css'>

 



   <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
@media (min-width: 768px) {
    .omb_row-sm-offset-3 div:first-child[class*="col-"] {
        margin-left: 25%;
    }
}

.omb_login .omb_authTitle {
    text-align: center;
	line-height: 300%;
}
	
.omb_login .omb_socialButtons a {
	color: white; // In yourUse @body-bg 
	opacity:0.9;
}
.omb_login .omb_socialButtons a:hover {
    color: white;
	opacity:1;    	
}
.omb_login .omb_socialButtons .omb_btn-facebook {background: #3b5998;}
.omb_login .omb_socialButtons .omb_btn-twitter {background: #00aced;}
.omb_login .omb_socialButtons .omb_btn-google {background: #c32f10;}


.omb_login .omb_loginOr {
	position: relative;
	font-size: 1.5em;
	color: #aaa;
	margin-top: 1em;
	margin-bottom: 1em;
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}
.omb_login .omb_loginOr .omb_hrOr {
	background-color: #cdcdcd;
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
.omb_login .omb_loginOr .omb_spanOr {
	display: block;
	position: absolute;
	left: 50%;
	top: -0.6em;
	margin-left: -1.5em;
	background-color: white;
	width: 3em;
	text-align: center;
}			

.omb_login .omb_loginForm .input-group.i {
	width: 2em;
}
.omb_login .omb_loginForm  .help-block {
    color: red;
}

	
@media (min-width: 768px) {
    .omb_login .omb_forgotPwd {
        text-align: right;
		margin-top:10px;
 	}		
}
</style>
   <link href="css/bootstrap.css" rel="stylesheet" />
    
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
	 <link href="css/ct-navbar.css" rel="stylesheet" /> 
  
    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
  
    
    
   <link rel="stylesheet" href="example/example.css">
  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>

  <!-- This is what you need -->
 
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
     <script src="https://code.angularjs.org/1.4.0-rc.1/angular.js"></script>
     
     <script src="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"></script>
    <script src="app.js"></script>
  <style type="text/css">
    .popover{
        max-width:600px;
        color: blue;
         background-color: lightgreen;
    }
</style>  
  <style>
  
    .cin.ng-valid {
          background-color: lightgreen;
      }
      .cin.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .cin.ng-dirty.ng-invalid-minlength {
          background-color: red;
      }
       .cin.ng-dirty.ng-invalid-maxlength {
          background-color: red;
      }
</style>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  







 <link href="css/bootstrap.css" rel="stylesheet" />
    
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
	 <link href="css/ct-navbar.css" rel="stylesheet" /> 
  
    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
  <link href="tcss/bootstrap.min.css" rel="stylesheet">
    <link href="tcss/font-awesome.min.css" rel="stylesheet">
    <link href="tcss/prettyPhoto.css" rel="stylesheet">
    <link href="tcss/price-range.css" rel="stylesheet">
    <link href="tcss/animate.css" rel="stylesheet">
	<link href="tcss/main.css" rel="stylesheet">
	<link href="tcss/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="tjs/html5shiv.js"></script>
    <script src="tjs/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    
<style type="text/css">body {
    padding-top:20px
}
#custom_carousel .item {

    color:#000;
    background-color:#eee;
    padding:20px 0;
}
#custom_carousel .controls{
    overflow-x: auto;
    overflow-y: hidden;
    padding:0;
    margin:0;
    white-space: nowrap;
    text-align: center;
    position: relative;
    background:#ddd
}
#custom_carousel .controls li {
    display: table-cell;
    width: 1%;
    max-width:90px
}
#custom_carousel .controls li.active {
    background-color:#eee;
    border-top:3px solid orange;
}
#custom_carousel .controls a small {
    overflow:hidden;
    display:block;
    font-size:10px;
    margin-top:5px;
    font-weight:bold
}</style>
<script type="text/javascript">$(document).ready(function(ev){
    $('#custom_carousel').on('slide.bs.carousel', function (evt) {
        $('#custom_carousel .controls li.active').removeClass('active');
        $('#custom_carousel .controls li:eq('+$(evt.relatedTarget).index()+')').addClass('active');
      })
  });</script>
</head>

<body class="hold-transition skin-blue sidebar-mini" ng-app="myApp" >


<div class="container">
    <div id="navbar-full">
    <div id="navbar">
<nav class="navbar navbar-ct-blue navbar-fixed-top" role="navigation">
          
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
             <a class="navbar-brand navbar-brand-logo" href="MenuClientPrincipale">
                    <div class="logo">
               <img src="facture/logoo.jpg" height="100" width="100" >
                    </div>
                    <div class="brand"> Société NEJMA</div>
              </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
               <li >
                          <a onclick="location.href = 'MenuClientPrincipale';" >
                                <i class="pe-7s-back">
                                <span class="label">!</span>
                                </i>
                                <p>Menu</p>
                            </a>
                         
                    </li>
                    <li>
                        <a href="javascript:void(0);" data-toggle="search" class="hidden-xs">
                            <i class="pe-7s-search"></i>
                            <p>Search</p>
                        </a>
                    </li>
                     <li>
                        <a href="ConsulterListeProduitVisiteurPromotion">
                            <i class="pe-7s-gift">
                                <span class="label">!</span>
                            </i>
                            <p>Consulter promotion</p>
                        </a>
                    </li> 
                    <li>
                        <a href="ConsulterListeProduitVisiteur">
                            <i class="pe-7s-look">
                                <span class="label">!</span>
                            </i>
                            <p>Consulter produit</p>
                        </a>
                    </li> 
                 
                    <li>
                        <a onclick="Inscrire()">
                            <i class="pe-7s-id">
                                <span class="label">!</span>
                            </i>
                            <p>Inscription</p>
                        </a>
                    </li>   
                    <li >
                          <a onclick="Ajouter()" >
                                <i class="pe-7s-user">
                                <span class="label">!</span>
                                </i>
                                <p>Connexion</p>
                            </a>
                         
                    </li>
               </ul>
               <form class="navbar-form navbar-right navbar-search-form" role="search">                  
                 <div class="form-group">
                      <input type="text" value="" class="form-control" placeholder="Search...">
                 </div> 
              </form>
                    
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>  </div>
    </div>
</div>

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
      <div class="row">
       </br></br>
    <%
                    String tRr=(String)session.getAttribute("notif");
                       if(tRr!=null){
                   %>     <div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        
                   <center>   <span class="glyphicon glyphicon-ok"></span> <%out.print(tRr);
                       } %>
                  </center> 
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
                                 
                        
            <section>
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
											<button onclick="Ajouter()"class="btn btn-danger "><i class="fa fa-shopping-cart"></i></button>
											
											
											<button onclick="Ajouter()"class="btn btn-warning"><i class="glyphicon glyphicon-heart-empty"></i></button>
											
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
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" ng-app="myApp">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Profil Utilisateur </h4>
      </div>
      <div class="modal-body" ng-controller="AppController as ctrl" >
        
<form  action="Inscrire" method="post"  ng-submit="ctrl.submit()" name="userForm" >
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
  
   

<input type="hidden" name="type" value="client"/>
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
						<button data-dismiss="modal" onclick="Ajouter()" class="btn btn-success btn-lg">
						<span class="glyphicon glyphicon-shopping-cart"></span>	Ajouter Panier
						</button>
				
						<button data-dismiss="modal" onclick="Ajouter()" class="btn btn-danger btn-lg">
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
      
     
  
  
  
    
   
	
  <script type="text/javascript">
  function Inscrire(){

	  $("#myModal1").modal();
	
	  
  }
  function Ajouter(){

	  $("#connex").modal();
	
	  
  }  </script>
 
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
      
  
 function Consulter(){
	  
 	 
	  $('#myModal8').modal();
  
}
     
      </script>
      
<script>


</script>
 <script type="text/javascript">
       $.cookie.json = true;
       var panier=[];
       function 


       Produit(idp,nom,image_p){
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
       <script src="js/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/js/bootstrap.js" type="text/javascript"></script>
	
	<script src="js/js/ct-navbar.js"></script>
	
	  <script src="tjs/jquery.js"></script>
	<script src="tjs/bootstrap.min.js"></script>
	<script src="tjs/jquery.scrollUp.min.js"></script>
	<script src="tjs/price-range.js"></script>
    <script src="tjs/jquery.prettyPhoto.js"></script>
    <script src="tjs/main.js"></script>
<script></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js">
      </script>  
       <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
     <script src="https://code.angularjs.org/1.4.0-rc.1/angular.js"></script>
       <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->

<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
 <script src="js/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="js/js/bootstrap.js" type="text/javascript"></script>
	
	<script src="js/js/ct-navbar.js"></script>
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
		

		  $('#price_filter').val('0-500');
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
