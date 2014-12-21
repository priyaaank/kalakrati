kalakratiApp.controller('CategoryController', ['$scope', '$http', 'CategoryProductListingService', function($scope, $http, CategoryProductListingService) {

    $scope.products = CategoryProductListingService.Products;
    $scope.categoryDetails = CategoryProductListingService.CategoryDetails;

    var updateProductAndCategoryDetails = function() {
        $scope.products = CategoryProductListingService.Products;
        $scope.categoryDetails = CategoryProductListingService.CategoryDetails;
    };

    $scope.$on('categoryProductDetails:updated', updateProductAndCategoryDetails);

    $scope.triggerProductFetchForCategory = function(url) {
        CategoryProductListingService.FetchCategoryDetailsFor(url);
    };

}]);