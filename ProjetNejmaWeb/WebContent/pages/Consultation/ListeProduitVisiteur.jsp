  <%@include file="../../MenuAdminV4.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head >
 <link href="css/bootstrap.css" rel="stylesheet" />
    
    <link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
	 <link href="css/ct-navbar.css" rel="stylesheet" /> 
  
    <!--     Font Awesome     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    <link href='http://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>
    <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>
  
    
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
             <a class="navbar-brand navbar-brand-logo" href="http://www.creative-tim.com">
                    <div class="logo">
               <img src="facture/logoo.jpg" height="100" width="100" >
                    </div>
                    <div class="brand"> Soci�t� NEJMA</div>
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
                      <li >
                          <a href="MenuClientPrincipale" >
                                <i class="pe-7s-back">
                                <span class="label">!</span>
                                </i>
                                <p>Menu</p>
                            </a>
                         
                    </li>
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
         <div class="alert alert-success">
                        <button data-dismiss="alert" class="close" type="button">&times;</button>
                        
                   <center>   <%
                    String tRr=(String)session.getAttribute("notif");
                       if(tRr!=null){
                   %><span class="glyphicon glyphicon-ok"></span> <%out.print(tRr);
                       } else{%>
                    <p>Cher client  inscrivez vous pour passer une commande</p>
                 <%} 
                       session.removeAttribute("notif");
                 %></center> 
                        <br />  
                  
                   </div>

   
          <div class="box">
            <div class="box-header">
              <center><h3 class="box-title">Liste des produits</h3></center>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                                 
                        
                       Categorie <select name="cat" id="cat" data-target="2" class="form-control filter">
                       <option value=""> </option>
    <%List<Categorie> lcat=(List<Categorie>)request.getAttribute("listcat");
    		   for (int i=0;i<lcat.size();i++){
    			   
    			   out.println("<option value='"+lcat.get(i).getNom()+"'>"+lcat.get(i).getNom()+"</option>");
    		   }
    		   %>
    
    
    </select>
  <div class="col-md-4">
            Minimum prix:
            <input type="number" id="min" name="min" class="form-control"></br>
      
            Maximum prix:
            <input type="text" id="max" name="max" class="form-control" ></br>
     </div>
              <table id="example1" class="table table-bordered table-hover table-striped">
                <thead>
             <tr>
              <th> </th>
             <th>ID</th>
                  <th class="select-filter">Nom</th>
                  <th class="select-filter">Designation</th>
                  <th>Prix</th>
                  <th>Quantit� diponible</th>
                  <th>Image</th>
                  <th class="select-filter">Categorie</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
                </thead>
                 <tfoot>
              <tr>
               <th> </th>
              <th>ID</th>
                  <th>Nom</th>
                  <th>Designation</th>
                  <th>Prix</th>
                  <th>Quantit� diponible</th>
                  <th>Image</th>
                  <th>Categorie</th>
                          <th class="datatable-nosort">action</th>
                         
                </tr>
        </tfoot>
                
               <tbody>
               
              <%
              ArrayList<Produit> produits =(ArrayList<Produit>)request.getAttribute("listProduit");
  			if (produits != null) {
  				
  				for (int i = 0; i < produits.size(); i++) 
  				{%>
				<tr data-key-1="Value 1" data-key-2="Value 2">
				<%
				   out.println( "<td class='details-control'></td>");
					out.println("<td> "+((Produit) produits.get(i)).getId()+"</td>");
					out.println("<td> " + ((Produit) produits.get(i)).getNom()+ "</td>");
					out.println("<td> " + ((Produit) produits.get(i)).getLibelle()+ "</td>");
					out.println("<td> " + ((Produit) produits.get(i)).getPrix()+ "</td>");
					if(((Produit) produits.get(i)).getQuantite()!=0){
					out.println("<td> " + ((Produit) produits.get(i)).getQuantite()+ "</td>");}
					else{	out.println("<td>pas dispo </td>");}
					out.println("<td><img width='120px' heigth='120px' src='image/"+((Produit) produits.get(i)).getImage()+"'/></td>");
					out.println("<td> " + ((Produit) produits.get(i)).getCategorie().getNom()+" </td>");
					if(((Produit) produits.get(i)).getQuantite()!=0){
					%>
			
					<td> <a  class='btn btn-info btn-sm' data-toggle='modal' onclick="AjouterProduit('<% out.print(((Produit) produits.get(i)).getId());%>','<% out.print(((Produit) produits.get(i)).getNom());%>','<% out.print(((Produit) produits.get(i)).getImage());%>')"><span class='glyphicon glyphicon-shopping-cart'></span>Ajouter au panier</a>
				<% 
					out.println(" <a  class='btn btn-warning btn-sm' onclick='aime("+((Produit) produits.get(i)).getId()+")'       ><span class='glyphicon glyphicon-heart'></span> ajouter au Favorie</a>  ");
					%> 
				     </td>
				       
			
					  					<%} else {out.println("<td> <a  class='btn btn-warning btn-sm' onclick='aime("+((Produit) produits.get(i)).getId()+")'       ><span class='glyphicon glyphicon-heart'></span> ajouter au Favorie</a> </td> ");}
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
            <label for="nm">N� Cin* :</label>
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
            <label for="nm">N� Adresse* :</label>
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
<script></script>
</body>
</html>
