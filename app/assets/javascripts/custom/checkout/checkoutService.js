angular.module('kalakrati.services').
  factory('CheckoutService', ['$http', '$location', function CheckoutService($http, $location) {

  CheckoutService.PaymentUrl = "/checkout/payment";
  CheckoutService.Address = {};

  CheckoutService.SaveCheckoutAddress = function(address) {
    return $http.post('/checkout/address', address).success(function(data) {
      CheckoutService.PaymentUrl = data.paymentUrl;
    });
  };

  CheckoutService.FetchAddressDetails = function() {
    return $http.get('/checkout/address.json').success(function(address) {
      CheckoutService.Address = address;
    });
  };

  return CheckoutService;
}
]);
