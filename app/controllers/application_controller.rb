class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def populate_root_categories
    @root_categories = Category.roots
  end

  def lookup_and_create_cart
    @cart_id = cookies[:guest_cart_id] and return if cookies[:guest_cart_id].present?
    guest_cart = ShoppingCart.create!
    cookies[:guest_cart_id] = { value: guest_cart.id, expires: 1.year.from_now }
    @cart_id = guest_cart.id
  end

end
