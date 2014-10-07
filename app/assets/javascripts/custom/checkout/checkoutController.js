kalakratiApp.controller('CheckoutController', ['$scope', '$location', '$window', 'CheckoutService', function($scope, $location, $window, CheckoutService) {

  $scope.address = CheckoutService.Address;

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

  }
]);
