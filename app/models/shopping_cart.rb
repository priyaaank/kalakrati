class ShoppingCart

  include Mongoid::Document

  embeds_many :shopping_cart_items



end
