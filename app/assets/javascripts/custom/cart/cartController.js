kalakratiApp.controller('CartController', ['$scope','$http', 'CartService', function($scope, $http, CartService) {

  $scope.cart_items = CartService.CartItems; 

  var cartUpdateSubscription = $scope.$on('cart:itemsUpdated',function(event, data) {
    $scope.cart_items = CartService.CartItems;
    $scope.currency = CartService.Currency;
  });
  $scope.$on('$destroy', cartUpdateSubscription);

  $scope.updateCartItems = function() {
    CartService.UpdateCartItems($scope.cart_items);
  };

  CartService.RefreshCartItems().then(function() {
    $scope.cart_items = CartService.CartItems;
    $scope.currency = CartService.Currency;
  });

  $scope.product_total = CartService.ProductTotal;
  $scope.tax = CartService.Tax;
  $scope.total_cost = CartService.TotalCost;

  $scope.deleteCartItem = function(itemId) {
    CartService.DeleteCartItem(itemId);
  }

}]);
