class OrderItem

  include Mongoid::Document

  belongs_to :product
  belongs_to :order
  
  field :discount, type: Float, default: 0
  field :quantity, type: Integer, default: 0

  validates_numericality_of :quantity, less_then: 1000, greater_then_or_equal_to: 0

  def self.from_cart_item shopping_cart_item, order
    order_item = OrderItem.new
    order_item.product = shopping_cart_item.product
    order_item.discount = shopping_cart_item.discount
    order_item.quantity = shopping_cart_item.quantity
    order_item.order = order
    order_item.save!
    order_item
  end

end
