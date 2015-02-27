class Admin::OrdersController < Admin::AdminController

  def manage
    @orders = Order.all.order(:order_date.desc)
  end

  def show
    order_id = params[:id]
    @order = Order.where(id: order_id).first
  end

  def update
    order = Order.where(id: params[:id]).first
    if order.present?
      order_state = params[:state]
      order.fire_state_event(order_state)
    end
    redirect_to admin_order_show_path(order.id)
  end

end