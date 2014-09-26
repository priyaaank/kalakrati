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

  def index
    cart = ShoppingCart.where(id: @cart_id).first
    cart_items = cart.shopping_cart_items
    render :json => as_hash(cart_items)
  end

  private

  def as_hash items
    items.collect do |item|
      {
        id: item.id.to_s,
        name: item.product.name,
        price: item.product.price,
        description: item.product.description,
        quantity: item.quantity,
        thumbnail_url: img_url(item.product.images.first.url),
        details_url: url_for(item.product)
      }
    end
  end

  def img_url image
    ActionController::Base.helpers.asset_path(image)
  end

end
