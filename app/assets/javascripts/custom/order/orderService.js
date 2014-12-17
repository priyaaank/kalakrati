angular.module('kalakrati.services').
  factory('OrderService', ['$http', '$location', function OrderService($http, $location) {

    OrderService.Order = {};

    OrderService.FetchOrderDetails = function(orderUrl) {
        return $http.get(orderUrl+'.json').success(function(orderDetails) {
            OrderService.Order = orderDetails;
        });
    };

    OrderService.ProductTotal = function() {
        var prodTotal = 0;
        var orderItems = OrderService.Order.order_items;
        for(var index in orderItems) {
            prodTotal += (orderItems[index].price.amount * orderItems[index].quantity);
        }
        return prodTotal;
    };

    OrderService.Tax = function() {
        return 0;
    };

    OrderService.TotalCost = function() {
        return  OrderService.ProductTotal() +  OrderService.Tax();
    };

    return OrderService;
  }
]);
