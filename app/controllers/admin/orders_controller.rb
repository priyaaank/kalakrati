class Admin::OrdersController < Admin::AdminController

  def manage
    @orders = Order.all.order(:order_date.desc)
  end

  def show
    order_id = params[:id]
    @order = Order.where(id: order_id).first
  end

end