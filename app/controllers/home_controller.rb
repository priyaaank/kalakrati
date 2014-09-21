class HomeController < ApplicationController

  before_filter :lookup_and_create_cart, only: [:index]
  before_filter :populate_root_categories

  def index
    @products = Product.all
    render :home
  end

  private

  def lookup_and_create_cart
    @cart_id = cookies[:guest_cart_id] and return if cookies[:guest_cart_id].present?
    guest_cart = ShoppingCart.create!
    cookies[:guest_cart_id] = { value: guest_cart.id, expires: 1.year.from_now }
    @cart_id = guest_cart.id
  end

end
