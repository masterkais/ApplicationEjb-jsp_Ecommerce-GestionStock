mainApp.controller("homeController", function($scope,$http,$cookieStore,$window) { 
	 var user = $cookieStore.get('user');
	 if(user==null){
		 $window.location.href = 'index.html';
	}
	
	$scope.username=user.nom+"  "+user.prenom;
	
	$scope.logout=function(){
		  $cookieStore.remove('user');
		  $window.location.href = 'index.html';
	}
	
});
