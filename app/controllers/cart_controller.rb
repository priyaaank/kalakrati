class CartController < ApplicationController

  before_filter :lookup_and_create_cart, only: [:show]
  before_filter :populate_root_categories

  def show
    @cart = ShoppingCart.where(:id => @cart_id).first
  end

end
