kalakratiApp.controller('ProductListingController', ['$scope','$http', function($scope, $http) {
      $http.get('products').success(function(data) {
        $scope.products = data;
      });

      $scope.addToCart = function(productId) {
        var data = {
          "productId" : productId,
          "quantity"  : 1
        };

        $http.put('cart/add', data).
          success(function(response) {
            console.log(response);
          });
       };
    }
  ]
);
