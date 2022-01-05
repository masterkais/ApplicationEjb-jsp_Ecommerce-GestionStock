
app.controller("ensController", function($scope,$http,DTOptionsBuilder, DTColumnBuilder,DTColumnDefBuilder,$compile,$resource) { 
	 var user = $cookieStore.get('user');
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
        	 $resource('Enseingnant/findall').query().$promise.then(function(data) {
        		 $scope.users = data;
        	    });
        	 return  $scope.users;
         }
	 
	   
	 getdata();
		
	
		var urld="matiere/findall"; 
		   $http.get(urld).success( function(response) { 
	        $scope.matieres = response; 
	 	  
	     }); 
	

	
        
      

	

		 $scope.user = {};
		
		  $scope.ajouter = function() 
		  { 
			  //var idg=$scope.groupe.id;
			   var addurl="Enseingnant/create"; 
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
	        	  var updurl="Enseingnant/update"; 
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
	   $scope.Supprimer=function(matricule){
	          $('#alert').hide(); 
			var surl="Enseingnant/delete?matricule="+matricule; 
	    if(confirm('veuillez vous supprimer ce enseignant!')){
		
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
	   
	   $scope.Modifier=function(matricule,grade,cin,nom,prenom,adresse,mail,tel,deps){
		   $scope.user.matricule=matricule;
		   $scope.user.grade=grade;
		   $scope.user.nom=nom;
		   $scope.user.prenom=prenom;
		   $scope.user.mail=mail;
		   $scope.user.cin=cin;
		   $scope.user.adresse=adresse;
		   $scope.user.groupe=deps;
		   $('#static').modal();
	   }
	   $scope.reset=function(){
		   $scope.user.departements=[];
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
	   $scope.ajoutermat = function(mat) 
		  { 
			  //var idg=$scope.groupe.id;
			   var addurl="matiere/update?mat="+mat; 
	          $('#alert').hide(); 
	         
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
					  
					  
				      });}
	         
	 
});



