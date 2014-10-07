angular.module('kalakrati.services').
  factory('CartService', ['$http','$rootScope', function CartService($http, $rootScope) {

    CartService.CartItems = [];

    CartService.RefreshCartItems = function() {
      return $http.get('/cart/items').success(function(data) {
        CartService.CartItems = data;
        $rootScope.$broadcast('cart:itemsUpdated');
      });
    };

    CartService.UpdateCartItems = function(items) {
      var data = {"cart_items" : []}; 
      for(index in items) {
        data["cart_items"].push({
          'quantity': items[index].quantity,
          'id': items[index].id.toString()
        });
      }
      return $http.put('/cart/items', data).success(function(data) {
        CartService.CartItems = data;
        $rootScope.$broadcast('cart:itemsUpdated');
      });
    };

    CartService.DeleteCartItem = function(itemId) {
      return $http.delete('/cart/item/'+itemId).success(function(data) {
        CartService.CartItems = data;
        $rootScope.$broadcast('cart:itemsUpdated');
      });
    };

    CartService.AddItemToCart = function(itemId, quantity) {
      var data = {
        "productId" : itemId,
        "quantity"  : 1
      };

      return $http.put('/cart/add', data).
        success(function(response) {
          CartService.RefreshCartItems();
        }).
        error(function() {
          console.log("Error adding item to cart");
        });
    };

    return CartService;
}]);
