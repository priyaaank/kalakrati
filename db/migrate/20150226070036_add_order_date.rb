class AddOrderDate < Mongoid::Migration
  def self.up
    Order.all.each do |order|
      order.update_attributes(order_date: Time.now)
    end
  end

  def self.down
    Order.all.each do |order|
      order.update_attributes(order_date: nil)
    end
  end
end