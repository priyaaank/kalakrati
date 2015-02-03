kalakratiApp.controller('ProductListingController', ['$scope', '$http', 'CartService', 'ProductService', function ($scope, $http, CartService, ProductService) {

      var isLastPage = function() {
          $scope.isLastPage = (ProductService.NextPage == "");
      };

      $scope.featured_products = ProductService.FeaturedProducts;

      $scope.addToCart = function(productId) {
        CartService.AddItemToCart(productId, 1);
        toastr['success']("Shopping cart updated!");
      };

      $scope.loadNextPage = function() {
          ProductService.fetchFeaturedProducts(ProductService.NextPage).then(function() {
              $scope.featured_products = ProductService.FeaturedProducts;
          });
      };

      $scope.$on("products:addedToListing", isLastPage);
      $scope.loadNextPage();

    }
]
);
