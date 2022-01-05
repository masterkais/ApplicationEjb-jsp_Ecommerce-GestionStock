<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="UTF-8">
    <link href="examples/assets/css/jquery-ui-1.10.2.custom.min.css" media="screen" rel="stylesheet" type="text/css">
    <script src="examples/assets/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="examples/assets/js/jquery-ui-1.10.2.custom.min.js" type="text/javascript"></script>
    <script src="examples/dist/filter.js" type="text/javascript"></script>
    <script src="examples/basic.js" type="text/javascript"></script>
    <script src="examples/assets/js/jquery.tinysort.min.js" type="text/javascript"></script>
    <link href="examples/assets/css/style.css" media="screen" rel="stylesheet" type="text/css">
  </head>
  <body>
    <div><h1 class="header_name">Filter.js</h1></div>
    <div class="container">
      <div class="sidebar_bar">
        <div class="sidebar_left_find">
          <div class="sidebar_list">
            <h3>Search</h3>
            <input type="text" id="search_box" class="searchbox" placeholder="Type here &hellip;" />
          </div>
        </div>
       
        <div class="sidebar_left_find">
          <div class="sidebar_list">
            <h3>Filter by Status</h3>
            <ul id="status">
              <li>
                <input id="active" value="active" type="checkbox">
                <span >Active</span>
              </li>
              <li>
                <input id="inactive" value="inactive" type="checkbox">
                <span>Inactive</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="featured_services_find">
        <h1 class="result_count"></h1>
        
        <div class="featured_list_find" id="showusers"></div>
      </div>
          <script>
          <script>$(document).ready(function() {
        		showusers();


        		function showusers(){
        		$.get("MenuClientPrincipale",function(users){

        		$("#showusers").html(showrecords(users));});}
        		function showrecords(data){
        		var table="<table border='1'>"+
        		"<tr>"+
        		"<th>id</th>"+
        		"<th>Nom</th>"+
        		"<th>libelle</th>"+
        		"<th>prix</th>"+
        		"<th>quantite</th>"+
        		"<th>image</th>"+
        		"<th>categorie_id</th>"+
        		"</tr>";

        		for(var i=0;i<data.length;i++){
        		table +="<tr>"+
        		"<td>"+data[i].id+"</td>"+
        		"<td>"+data[i].nom+"</td>"+
        		"<td>"+data[i].libelle+"</td>"+
        		"<td>"+data[i].prix+"</td>"+
        		"<td>"+data[i].quantite+"</td>"+
        		"<td>"+data[i].image+"</td>"+
        		"<td>"+data[i].categorie_id+"</td>"+
        		"</tr>";
        		}
        		table +="</table>";
        		return table;
        		}
        		});


       
 
        //]]>
      </script>
     <script id="template" type="text/html">
       
    </script>
      <div class="clear"></div>
    </div>

 
 
  </body>
</html>
