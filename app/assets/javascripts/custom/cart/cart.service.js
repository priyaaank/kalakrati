angular.module('kalakrati.services', []).
  factory('CartService', ['$http', function($http) {
    var cartItems = [];
    var cartAPI = {};

    cartAPI.refreshCartItems = function() {
      $http.get('/cart/items').success(function(data) {
        cartItems = data;
      });
    }

    cartAPI.cartItems = function() {
      return cartItems;
    }

    return cartAPI;
}]);
