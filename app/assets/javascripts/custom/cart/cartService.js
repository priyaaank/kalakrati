angular.module('kalakrati.services').
  factory('CartService', ['$http','$rootScope', function CartService($http, $rootScope) {

    CartService.CartItems = [];
    CartService.Currency = "";

    CartService.RefreshCartItems = function() {
      return $http.get('/cart/items').success(function(data) {
        CartService.CartItems = data.cart_items;
        CartService.Currency = data.currency;
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
        CartService.CartItems = data.cart_items;
        CartService.Currency = data.currency;
        $rootScope.$broadcast('cart:itemsUpdated');
      });
    };

    CartService.DeleteCartItem = function(itemId) {
      return $http.delete('/cart/item/'+itemId).success(function(data) {
        CartService.CartItems = data.cart_items;
        CartService.Currency = data.currency;
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

    CartService.ProductTotal = function() {
        var prodTotal = 0;
        for(var index in CartService.CartItems) {
            prodTotal += (CartService.CartItems[index].price.amount * CartService.CartItems[index].quantity);
        }
        return prodTotal;
    };

    CartService.Tax = function() {
        return 0;
    };

    CartService.TotalCost = function() {
        return  CartService.ProductTotal() +  CartService.Tax();
    };

    return CartService;
}]);
