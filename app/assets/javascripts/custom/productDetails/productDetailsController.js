kalakratiApp.controller('ProductDetailsController', ['$scope', '$http', 'CartService', function($scope, $http, CartService) {
    var quantities = [{'value':"",'key':"Quantity"}];
    for(i=1; i<21; i++) {
      quantities.push({'value':i,'key':i});
    }
    $scope.quantities = quantities;
    $scope.selectedQuantity = $scope.quantities[0];

    $scope.AddToCart = function(itemId) {
      CartService.AddItemToCart(itemId, $scope.userSelectedQuantityValue());
      toastr['success']("Shopping cart updated!");
    }

    $scope.userSelectedQuantityValue = function() {
        return parseInt($("select").val());
    }
  }
]);
