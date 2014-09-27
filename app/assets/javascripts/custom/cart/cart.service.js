angular.module('kalakrati.services', []).
  factory('CartService', ['$http', function($http) {
    var cartItems = [];
    var cartAPI = {};

    cartAPI.refreshCartItems = function() {
      $http.get('/cart/items').success(function(data) {
        cartItems = data;
      });
    };

    cartAPI.updateCartItems = function(items) {
      var data = {"cart_items" : []}; 
      for(index in items) {
        data["cart_items"].push({
          'quantity': items[index].quantity,
          'id': items[index].id.toString()
        });
      }
      $http.put('/cart/items', data).success(function(data) {
        cartItems = data;
      });
    };

    cartAPI.cartItems = function() {
      return cartItems;
    };

    return cartAPI;
}]);
