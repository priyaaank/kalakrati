class Admin::OrdersController < Admin::AdminController

  def manage
    @orders = Order.all
  end

end