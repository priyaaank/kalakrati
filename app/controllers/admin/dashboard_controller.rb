class Admin::DashboardController < Admin::AdminController

  def show
    @order_count = Order.all.count
    @product_count = Product.all.count
    @shopping_cart_count = ShoppingCart.all.count
    @abandoned_shopping_cart_count = ShoppingCart.where(:id.in => ShoppingCartItem.distinct(:shopping_cart_id)).count
    render :show
  end

end