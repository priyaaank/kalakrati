kalakratiApp.controller('CheckoutController', ['$scope', function($scope) {

  $scope.addressDetails = {};

  $scope.submitForm = function(isFormValid) {
    if(isFormValid) {
      alert("Awesome");
    };
  };


  }
]);
