kalakratiApp.controller('CartController', ['$scope','$http', function($scope, $http) {

  $http.get('cart/items').success(function(data) {
    console.log(data);
    $scope.cart_items = data;
  });

}]);
