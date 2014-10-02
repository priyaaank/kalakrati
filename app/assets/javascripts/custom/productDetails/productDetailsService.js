angular.module('kalakrati.services').
  factory('ProductService', ['$http', function ProductService($http) {
    
    ProductService.FeaturedProducts = [];

    ProductService.fetchFeaturedProducts = function() {
      return $http.get('products').success(function(data) {
        ProductService.FeaturedProducts = data;
      }).error(function() {
        console.log("error in fetching featured products!");
      });
    };


    
    return ProductService;
  }
]);
