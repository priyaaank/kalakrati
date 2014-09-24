kalakratiApp.controller('ProductDetailsController', ['$scope', '$http', function($scope, $http) {
    var quantities = [{'value':"",'key':"Quantity"}];
    for(i=1; i<21; i++) {
      quantities.push({'value':i,'key':i});
    }
    $scope.quantities = quantities;
    $scope.selectedQuantity = $scope.quantities[0];
  }
]);
