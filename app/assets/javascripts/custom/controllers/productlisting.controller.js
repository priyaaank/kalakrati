kalakratiApp.controller('ProductListingController', ['$scope','$http','CartService', function($scope, $http, CartService) {
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
            CartService.refreshCartItems();
          });
       };
    }
  ]
);
