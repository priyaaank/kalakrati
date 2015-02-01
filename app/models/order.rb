class Order

  include Mongoid::Document

  field :tnc_acceptance, type: Boolean, default: false
  field :payment_notes, type: String
  has_many :order_items
  embeds_one :address

  field :currency, type: String, default: Price::Symbol::INR

  def self.from_cart shopping_cart
    new_order = Order.new
    new_order.address = shopping_cart.address
    new_order.currency = shopping_cart.currency
    new_order.order_items = shopping_cart.shopping_cart_items.collect { |item| OrderItem.from_cart_item(item, new_order) }
    new_order.tnc_acceptance = shopping_cart.tnc_acceptance
    new_order.payment_notes = shopping_cart.payment_notes
    new_order.save!
    new_order
  end

  def total_order_amount
    order_items.sum(&:total_cost)
  end

end
