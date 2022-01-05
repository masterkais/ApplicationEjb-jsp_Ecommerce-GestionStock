<%@page import="services.InterfaceGestionProduitRemote"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="entityBeans.*,javax.ejb.EJB,java.util.ArrayList,java.util.Iterator,java.text.SimpleDateFormat,java.util.Collection" import="java.util.List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="showusers">

</div>
<script>$(document).ready(function() {
	showusers();


	function showusers(){
	$.get("ChartJS",function(users){

	$("#showusers").html(showrecords(users));});}
	function showrecords(data){
	var table="<table border='1'>"+
	"<tr>"+
	"<th>id</th>"+
	"<th>nom</th>"+
	
	"</tr>";

	for(var i=0;i<data.length;i++){
	table +="<tr>"+
	"<td>"+data[i].id+"</td>"+
	"<td>"+data[i].nom+"</td>"+

	"</tr>";
	}
	table +="</table>";
	return table;
	}
	});


</script>
</body>
</html>