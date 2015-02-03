kalakratiApp.controller('CheckoutController', ['$scope', '$location', '$window', 'CartService', 'CheckoutService', function($scope, $location, $window, CartService, CheckoutService) {

    $scope.address = CheckoutService.Address;
    $scope.cart_items = CartService.CartItems;

    var cartUpdateSubscription = $scope.$on('cart:itemsUpdated',function(event, data) {
        $scope.cart_items = CartService.CartItems;
        $scope.currency = CartService.Currency;
    });

    $scope.$on('$destroy', cartUpdateSubscription);
    $scope.submitAddressDetails = function(isFormValid) {
    if(isFormValid) {
      CheckoutService.SaveCheckoutAddress($scope.address).then(function() {
        $window.location.href = CheckoutService.PaymentUrl;
      });
    };
    };

    $scope.submitPaymentDetails = function() {
    CheckoutService.UpdatePaymentDetails($scope.paymentDetails).success(function(){
      $window.location.href = CheckoutService.ConfirmationUrl;
    });
    };

    CheckoutService.FetchAddressDetails().then(function() {
        $scope.address = CheckoutService.Address;
    });

    CheckoutService.FetchPaymentDetails().then(function() {
        $scope.paymentDetails = CheckoutService.PaymentDetails;
    });

    $scope.product_total = CartService.ProductTotal;
    $scope.tax = CartService.Tax;
    $scope.total_cost = CartService.TotalCost;

  }
]);
