kalakratiApp.controller('CartController', ['$scope','$http', 'CartService', function($scope, $http, CartService) {

  $scope.cart_items = CartService.CartItems; 

  var cartUpdateSubscription = $scope.$on('cart:itemsUpdated',function(event, data) {
    $scope.cart_items = CartService.CartItems;
  });
  $scope.$on('$destroy', cartUpdateSubscription);

  $scope.updateCartItems = function() {
    CartService.UpdateCartItems($scope.cart_items);
  };

  CartService.RefreshCartItems().then(function() {
    $scope.cart_items = CartService.CartItems;
  });

  $scope.product_total = function() {
    var prodTotal = 0;
    for(var index in $scope.cart_items) {
      prodTotal += ($scope.cart_items[index].price.amount * $scope.cart_items[index].quantity);
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
    CartService.DeleteCartItem(itemId);
  }

}]);
