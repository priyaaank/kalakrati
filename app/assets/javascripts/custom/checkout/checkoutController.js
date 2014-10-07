kalakratiApp.controller('CheckoutController', ['$scope', '$location', '$window', 'CheckoutService', function($scope, $location, $window, CheckoutService) {

  $scope.address = CheckoutService.Address;

  $scope.submitForm = function(isFormValid) {
    if(isFormValid) {
      CheckoutService.SaveCheckoutAddress($scope.address).then(function() {
        $window.location.href = CheckoutService.PaymentUrl;
      });
    };
  };

  CheckoutService.FetchAddressDetails().then(function() {
    $scope.address = CheckoutService.Address;
  });

  }
]);
