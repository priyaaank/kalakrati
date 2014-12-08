angular.module('kalakrati.services').
  factory('CheckoutService', ['$http', '$location', function CheckoutService($http, $location) {

  CheckoutService.PaymentUrl = "/checkout/payment";
  CheckoutService.ConfirmationUrl = "/checkout/confirm";
  CheckoutService.Address = {};
  CheckoutService.PaymentDetails = {};

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

  CheckoutService.FetchPaymentDetails = function() {
    return $http.get('/checkout/payment.json').success(function(paymentDetails) {
      CheckoutService.PaymentDetails = paymentDetails;
    });
  };

  CheckoutService.UpdatePaymentDetails = function(paymentDetails) {
    return $http.put('/checkout/payment.json', paymentDetails).success(function(data) {
      CheckoutService.ConfirmationUrl = data.orderUrl;
    });
  };

  return CheckoutService;
}
]);
