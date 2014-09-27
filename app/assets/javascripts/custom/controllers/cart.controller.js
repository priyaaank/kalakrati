kalakratiApp.controller('CartController', ['$scope','$http', 'CartService', function($scope, $http, cartService) {

  $scope.cart_items = []; 

  $scope.$watch(cartService.cartItems, function(value) {
    $scope.cart_items = cartService.cartItems(); 
    $scope.product_total = 0;
    $scope.tax = 0;
    $scope.total_cost = 0;
    for(var index in $scope.cart_items) {
      $scope.product_total += ($scope.cart_items[index].price * $scope.cart_items[index].quantity);
    }
    $scope.total_cost = $scope.product_total + $scope.tax;
  }, true);

  cartService.refreshCartItems();

}]);
