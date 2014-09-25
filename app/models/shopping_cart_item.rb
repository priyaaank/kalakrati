class ShoppingCartItem

  include Mongoid::Document

  belongs_to :product
  belongs_to :shopping_cart


  field :discount, type: Float, default: 0
  field :quantity, type: Integer, default: 0

end
