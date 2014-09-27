kalakratiApp.controller('CartController', ['$scope','$http', function($scope, $http) {

  $scope.cart_items = [];

  $scope.$watch('cart_items', function() {
    $scope.product_total = 0;
    $scope.tax = 0;
    $scope.total_cost = 0;
    for(var index in $scope.cart_items) {
      $scope.product_total += ($scope.cart_items[index].price * $scope.cart_items[index].quantity);
    }
    $scope.total_cost = $scope.product_total + $scope.tax;
  }, true);


  $http.get('cart/items').success(function(data) {
    console.log(data);
    $scope.cart_items = data;
  });

}]);
