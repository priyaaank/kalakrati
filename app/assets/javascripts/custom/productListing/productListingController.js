kalakratiApp.controller('ProductListingController', ['$scope', '$http', 'CartService', 'ProductService', function ($scope, $http, CartService, ProductService) {

      $scope.featured_products = ProductService.FeaturedProducts;

      $scope.addToCart = function(productId) {
        CartService.AddItemToCart(productId, 1);
      };

      ProductService.fetchFeaturedProducts().then(function() {
        $scope.featured_products = ProductService.FeaturedProducts;
      });
    }
]
);
