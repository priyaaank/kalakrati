kalakratiApp.controller('CartController', ['$scope','$http', function($scope, $http) {

  $http.get('cart/items').success(function(data) {
    console.log(data);
    $scope.cart_items = data;

      var totalPrice = 0.0;
      var tax = 0.0;
      for(var index in $scope.cart_items) {
        totalPrice += ($scope.cart_items[index].price * $scope.cart_items[index].quantity);
      }
      $scope.product_total = totalPrice;
      $scope.tax = tax
      $scope.total_cost = $scope.product_total + $scope.tax;
  });

}]);
