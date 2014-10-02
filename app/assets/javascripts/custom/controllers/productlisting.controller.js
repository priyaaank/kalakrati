kalakratiApp.controller('ProductListingController', ['$scope', '$http', 'CartService', 'ProductService', function ($scope, $http, CartService, ProductService) {

      $scope.featured_products = ProductService.FeaturedProducts;

      $scope.addToCart = function(productId) {
        var data = {
          "productId" : productId,
          "quantity"  : 1
        };

        $http.put('cart/add', data).
          success(function(response) {
            CartService.RefreshCartItems();
          });
       };

       ProductService.fetchFeaturedProducts().then(function() {
        $scope.featured_products = ProductService.FeaturedProducts;
       });
    }
]
);
