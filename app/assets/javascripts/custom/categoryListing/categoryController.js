kalakratiApp.controller('CategoryController', ['$scope', '$http', 'CategoryProductListingService', 'CartService', function($scope, $http, CategoryProductListingService, CartService) {

    $scope.products = CategoryProductListingService.Products;
    $scope.categoryDetails = CategoryProductListingService.CategoryDetails;
    $scope.startRecordCount = 0;
    $scope.endRecordCount = 0;

    var updateProductAndCategoryDetails = function() {
        $scope.products = CategoryProductListingService.Products;
        $scope.categoryDetails = CategoryProductListingService.CategoryDetails;
        updateStartRecordCount();
        updateEndRecordCount();
    };

    $scope.$on('categoryProductDetails:updated', updateProductAndCategoryDetails);

    $scope.triggerProductFetchForCategory = function(url) {
        CategoryProductListingService.FetchCategoryDetailsFor(url);
    };

    var updateStartRecordCount = function() {
        $scope.startRecordCount = ($scope.categoryDetails.current_page * $scope.categoryDetails.records_per_page) - ($scope.categoryDetails.records_per_page - 1);
    };

    var updateEndRecordCount = function() {
        $scope.endRecordCount = $scope.startRecordCount + ($scope.categoryDetails.product_count - 1);
    };

    $scope.addToCart = function(productId) {
        CartService.AddItemToCart(productId, 1);
    };

}]);