class Order

  include Mongoid::Document

  field :tnc_acceptance, type: Boolean, default: false
  field :payment_notes, type: String
  field :order_date, type: DateTime
  has_many :order_items
  embeds_one :address
  embeds_many :order_audit_logs

  field :currency, type: String, default: Price::Symbol::INR

  state_machine :order_state, :initial => :ordered do

    before_transition :audit_log

    event :pay do
      transition :ordered => :paid
    end

    event :ship do
      transition [:ordered, :paid] => :shipped
    end

    event :deliver do
      transition [:ordered, :paid, :shipped] => :delivered
    end

    event :refund do
      transition [:cancelled, :delivered] => :refunded
    end

    event :cancel do
      transition [:ordered, :paid, :shipped] => :cancelled
    end

  end

  def audit_log(transition)
    self.order_audit_logs << OrderAuditLog.new(from: transition.from, to: transition.to, event: transition.event, when: Time.now)
  end

  def self.from_cart shopping_cart
    new_order = Order.new
    new_order.address = shopping_cart.address
    new_order.currency = shopping_cart.currency
    new_order.order_items = shopping_cart.shopping_cart_items.collect { |item| OrderItem.from_cart_item(item, new_order) }
    new_order.tnc_acceptance = shopping_cart.tnc_acceptance
    new_order.payment_notes = shopping_cart.payment_notes
    new_order.order_date = Time.now
    new_order.save!
    new_order
  end

  def customer_name
    "#{self.address.first_name||''} #{self.address.last_name||''}"
  end

  def display_address
    "#{address.address_line1||''} \n #{address.address_line2||''} #{address.city || ''} #{address.state || ''} #{address.zipcode || ''} #{address.country || ''}"
  end

  def total_order_amount
    order_items.sum(&:total_cost)
  end

end
