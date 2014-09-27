class ShoppingCartItem

  include Mongoid::Document

  belongs_to :product
  belongs_to :shopping_cart


  field :discount, type: Float, default: 0
  field :quantity, type: Integer, default: 0

  validates_numericality_of :quantity, less_then: 1000, greater_then_or_equal_to: 0

end
