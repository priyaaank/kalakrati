var kalakratiApp = angular.module('kalakrati',[]);

kalakratiApp.controller('ProductListingController', ['$scope','$http', function($scope, $http) {
      $http.get('products').success(function(data) {
        $scope.products = data;
      });
    }
  ]
);
