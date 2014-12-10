class Order

  include Mongoid::Document

  has_many :order_items
  embeds_one :address

  def self.from_cart shopping_cart
    new_order = Order.new
    new_order.address = shopping_cart.address
    new_order.order_items = shopping_cart.shopping_cart_items.collect { |item| OrderItem.from_cart_item(item, new_order) }
    new_order.save!
    new_order
  end

end
