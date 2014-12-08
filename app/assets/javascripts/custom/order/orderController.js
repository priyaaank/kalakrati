kalakratiApp.controller('OrderController', ['$scope', '$location', '$window', 'OrderService', function($scope, $location, $window, OrderService) {

    $scope.order = OrderService.Order;

    OrderService.FetchOrderDetails($window.location.href).then(function() {
        $scope.order = CheckoutService.Order;
    });
    
  }
]);
