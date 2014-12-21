angular.module('kalakrati.services').
    factory('CategoryProductListingService', ['$http', '$location', '$rootScope', function CategoryProductListingService($http, $location, $rootScope) {

        CategoryProductListingService.CategoryDetails={};
        CategoryProductListingService.Products=[];

        CategoryProductListingService.FetchCategoryDetailsFor = function(productsUrl) {
            return $http.get(productsUrl +'.json').success(function(data) {
                CategoryProductListingService.CategoryDetails.data;
                CategoryProductListingService.Products = data.products;
                $rootScope.$broadcast('categoryProductDetails:updated');
            });
        };

        return CategoryProductListingService;
    }
]);