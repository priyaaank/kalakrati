angular.module('kalakrati.services').
  factory('OrderService', ['$http', '$location', function OrderService(http, location) {

    OrderService.FetchOrderDetails = function() {
      return $http.get('/order').success(function(orderDetails) {
        OrderService.Order = orderDetails;
      });
    };

    return OrderService;
  }
]);
