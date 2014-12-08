angular.module('kalakrati.services').
  factory('OrderService', ['$http', '$location', function OrderService($http, $location) {

    OrderService.Order = {};

    OrderService.FetchOrderDetails = function(orderUrl) {
      return $http.get(orderUrl+'.json').success(function(orderDetails) {
        OrderService.Order = orderDetails;
      });
    };

    return OrderService;
  }
]);
