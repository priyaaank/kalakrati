class Admin::OrdersController < Admin::AdminController

  def manage
    @orders = Order.all.order(:order_date.desc)
  end

end