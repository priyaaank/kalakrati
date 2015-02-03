kalakratiApp.controller('CartController', ['$scope','$http', 'CartService', function($scope, $http, CartService) {

  $scope.cart_items = CartService.CartItems;

  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-bottom-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "2000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }

  var cartUpdateSubscription = $scope.$on('cart:itemsUpdated',function(event, data) {
    $scope.cart_items = CartService.CartItems;
    $scope.currency = CartService.Currency;
  });

  $scope.$on('$destroy', cartUpdateSubscription);

  $scope.updateCartItems = function() {
    CartService.UpdateCartItems($scope.cart_items);
    toastr['success']("Shopping cart updated!");
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
    toastr['success']("Shopping cart updated!");
  }

  $scope.shouldAllowCheckout = function() {
      return CartService.ProductTotal() > 0;
  }

}]);
