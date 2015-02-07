class Admin::DashboardController < Admin::AdminController

  def show
    @order_count = Order.all.count
    @product_count = Product.all.count
    @shopping_cart_count = ShoppingCart.all.count
    render :show
  end

end