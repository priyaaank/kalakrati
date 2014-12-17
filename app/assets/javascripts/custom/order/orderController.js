kalakratiApp.controller('OrderController', ['$scope', '$location', '$window', 'OrderService', function($scope, $location, $window, OrderService) {

    $scope.order = OrderService.Order;

    OrderService.FetchOrderDetails($window.location.href).then(function() {
        $scope.order = OrderService.Order;
        $scope.currency = OrderService.Order.currency;
        $scope.order_items = OrderService.Order.order_items;
    });

    $scope.product_total = OrderService.ProductTotal;
    $scope.tax = OrderService.Tax;
    $scope.total_cost = OrderService.TotalCost;
  }
]);
