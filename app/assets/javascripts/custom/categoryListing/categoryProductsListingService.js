angular.module('kalakrati.services').
    factory('CategoryProductListingService', ['$http', '$location', '$rootScope', function CategoryProductListingService($http, $location, $rootScope) {

        CategoryProductListingService.CategoryDetails={};
        CategoryProductListingService.Products=[];
        CategoryProductListingService.CategoryProductsUrl = "";

        CategoryProductListingService.FetchCategoryDetailsFor = function() {
            return $http.get(CategoryProductListingService.CategoryProductsUrl +'.json').success(function(data) {
                CategoryProductListingService.CategoryDetails = data;
                CategoryProductListingService.Products = data.products;
                $rootScope.$broadcast('categoryProductDetails:updated');
            });
        };

        return CategoryProductListingService;
    }
]);