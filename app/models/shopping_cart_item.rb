class ShoppingCartItem

  include Mongoid::Document

  has_one :product
  embedded_in :shopping_cart


  field :discount, type: Float
  field :quantity, type: Integer

end
