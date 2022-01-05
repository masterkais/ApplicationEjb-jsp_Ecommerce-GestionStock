
app.controller("etudController", function($scope,$http,DTOptionsBuilder, DTColumnBuilder,DTColumnDefBuilder,$compile,$resource) { 
	$scope.alert=false;
	 $scope.dtOptions = DTOptionsBuilder.newOptions().withPaginationType('full_numbers')
	    .withDOM('frtip')
	 .withOption('bInfo',false)
	 .withOption('bFilter',false);

	 $scope.dtColumnDefs = [
	                    DTColumnDefBuilder.newColumnDef(0),
	                    DTColumnDefBuilder.newColumnDef(1),
	                    DTColumnDefBuilder.newColumnDef(2),
	                    DTColumnDefBuilder.newColumnDef(3),
	                    DTColumnDefBuilder.newColumnDef(4),
	                    DTColumnDefBuilder.newColumnDef(5),
	                    DTColumnDefBuilder.newColumnDef(6).notSortable()
	                  
	                   
	                ];
	function getdata(){
        	 var users=[];
        	 $resource('user/findall').query().$promise.then(function(data) {
        		 $scope.users = data;
        	    });
        	 return  $scope.users;
         }
	 
	$scope.reloadRoute = function() {
		   $route.reload();
		}
	 getdata();
		
	
	var urld="groupe/findall"; 
	   $http.get(urld).success( function(response) { 
        $scope.groupes = response; 
 	  
     }); 
	

	
        
      

	

		
		
		  $scope.ajouter = function() 
		  { 
			  //var idg=$scope.groupe.id;
			   var addurl="user/create"; 
	          $('#alert').hide(); 
	          if($scope.user.id==null){
				  $http({
				      method: 'POST',
				      url: addurl,
				      headers: {'Content-Type': 'application/json'},
				      data:  $scope.user
				    }).success(function (data) 
				      {
				    	$scope.status=data;
				   	           getdata();
					      	   $('#alert').show(); 
					  
					  
				      });
	          }else{
	              $('#alert').hide(); 
	        	  var updurl="user/update"; 
	        	  $http({
				      method: 'POST',
				      url: updurl,
				      headers: {'Content-Type': 'application/json'},
				      data:  $scope.user
				    }).success(function (data) 
				      {
				    	$scope.status=data;
				    	   getdata();
				      	   $('#alert').show(); 
		
				      });
	          }
		    
		  }
	   $scope.Supprimer=function(numInscription){
	          $('#alert').hide(); 
			var surl="user/delete?numInscription="+numInscription; 
	    if(confirm('veuillez vous supprimer ce etudiant!')){
		
			 $http({
			      method: 'GET',
			      url: surl,
			      headers: {'Content-Type': 'text/plain'},
			      data:  null
			    }).success(function (data) 
			      {
			    	$scope.status=data;
			    	getdata();
			      	   $('#alert').show(); 
			     
			      });
	}
	   }
	   
	   $scope.Modifier=function(numInscription,cin,nom,prenom,adresse,mail,tel,deps){
		   $scope.user.numInscription=numInscription;
		   $scope.user.nom=nom;
		   $scope.user.prenom=prenom;
		   $scope.user.mail=mail;
		   $scope.user.cin=cin;
		   $scope.user.adresse=adresse;
		  
		   $('#static').modal();
	   }
	   $scope.reset=function(){
	
		   $scope.user={};
		
		   $('#static').modal();
		   
	   }
	   
	  /* $scope.checkAll = function() {
		    $scope.user.departements = angular.copy($scope.departemetns);
		  };
		  $scope.uncheckAll = function() {
		    $scope.user.departements = [];
		  };
		 */
	 
});



