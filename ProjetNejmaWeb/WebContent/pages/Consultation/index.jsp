<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page language="java" import="entityBeans.*,java.util.ArrayList,java.util.Iterator,java.text.SimpleDateFormat,java.util.Collection" import="java.util.List" %>


<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>  
<body>

<h2>Validation Example</h2>

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://cdn.datatables.net/responsive/1.0.1/js/dataTables.responsive.min.js"></script>
<script src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.css" />

<style>

 td.details-control {
    background: url('http://www.datatables.net/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
}
tr.shown td.details-control {
    background: url('http://www.datatables.net/examples/resources/details_close.png') no-repeat center center;
}

</style>
<table id="example" class="display nowrap" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th></th>
            <th>Nom</th>
            <th>Designation</th>
            
         
        </tr>
    </thead>
    <tbody>
             
        <%
ArrayList<Categorie> categories =(ArrayList<Categorie>)request.getAttribute("list");
			if (categories != null) {
				
				for (int i = 0; i < categories.size(); i++) 
				{%>
				<tr data-key-1="Designation" data-key-2="Designation">
				<%
				out.println( "<td class='details-control'></td>");
				
					out.println("<td > " + ((Categorie) categories.get(i)).getNom()+ "</td>");
					out.println("<td> " + ((Categorie) categories.get(i)).getLibelle()+ "</td>");
					
				 %> 
					    
					       
						</td></tr><%
						  					
					}
					
				}
			%>  
     
    </tbody>
</table>
<script>
function format ( d ) {
    // `d` is the original data object for the row
    return '<div class="slider">'+
        '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
            '<tr>'+
            
                '<td>Nom:</td>'+
                '<td>'+ d.Name+'</td>'+
            '</tr>'+
            '<tr>'+
                '<td>Designationr:</td>'+
                '<td>'+d.Designation+'</td>'+
            '</tr>'+
        '</table>'+
    '</div>';
}

$(document).ready(function() {
    var table = $('#example').DataTable({"columns": [
     
        { "data": "Nom" },
        { "data": "Designation" }]
     
	});


    // Add event listener for opening and closing details
    $('#example tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );

        if ( row.child.isShown() ) {
            // This row is already open - close it
            $('div.slider', row.child()).slideUp( function () {
                row.child.hide();
                tr.removeClass('shown');
            } );
        }
        else {
            // Open this row
            row.child( format(row.data()), 'no-padding' ).show();
            tr.addClass('shown');

            $('div.slider', row.child()).slideDown();
        }
    } );
} );
  

</script>

</body>
</html>
