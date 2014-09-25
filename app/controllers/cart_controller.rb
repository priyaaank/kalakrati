class CartController < ApplicationController

  before_filter :lookup_and_create_cart
  before_filter :populate_root_categories

  def show
    @cart = ShoppingCart.where(:id => @cart_id).first
  end

  def add
    product_id_to_add = params[:productId]
    quantity_to_add = params[:quantity]
    product = Product.where(:id => product_id_to_add).first
    if product.present?
      ShoppingCart.where(:id => @cart_id).first.add(product, quantity_to_add)
      status_code = 200
    else
      status_code = 404
    end
    render status: status_code, nothing: true
  end

end
