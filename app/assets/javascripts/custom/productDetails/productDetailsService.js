angular.module('kalakrati.services').
  factory('ProductService', ['$http','$rootScope', function ProductService($http, $rootScope) {
    
    ProductService.FeaturedProducts = [];
    ProductService.NextPage = "products";

    ProductService.fetchFeaturedProducts = function(productsPageUrl) {
      return $http.get(productsPageUrl).success(function(data) {
        ProductService.FeaturedProducts = ProductService.FeaturedProducts.concat(data.products);
        ProductService.NextPage = data.next_page;
        $rootScope.$broadcast('products:addedToListing');
      }).error(function() {
        console.log("error in fetching featured products!");
      });
    };

    return ProductService;
  }
]);
