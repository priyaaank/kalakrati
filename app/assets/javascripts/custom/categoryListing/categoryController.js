kalakratiApp.controller('CategoryController', ['$scope', '$http', 'CategoryProductListingService', 'CartService', function($scope, $http, CategoryProductListingService, CartService) {

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

    $scope.addToCart = function(productId) {
        CartService.AddItemToCart(productId, 1);
    };

}]);