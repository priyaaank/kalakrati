kalakratiApp.controller('CartController', ['$scope','$http', 'CartService', function($scope, $http, CartService) {

  $scope.cart_items = []; 

  $scope.$watch(CartService.cartItems, function(value) {
    $scope.cart_items = CartService.cartItems();
  }, true);

  $scope.updateCartItems = function() {
    CartService.updateCartItems($scope.cart_items);
  };

  CartService.refreshCartItems();

  $scope.product_total = function() {
    var prodTotal = 0;
    for(var index in $scope.cart_items) {
      prodTotal += ($scope.cart_items[index].price * $scope.cart_items[index].quantity);
    }
    return prodTotal;
  };

  $scope.tax = function() {
    return 0;
  };

  $scope.total_cost = function() {
    return $scope.product_total() + $scope.tax();
  };

  $scope.deleteCartItem = function(itemId) {
    CartService.deleteCartItem(itemId);
  }

}]);
