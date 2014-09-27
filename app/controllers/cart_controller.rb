class CartController < ApplicationController

  before_filter :lookup_and_create_cart
  before_filter :populate_root_categories

  def show
    @cart = guest_shopping_cart
  end

  def add
    product_id_to_add = params[:productId]
    quantity_to_add = params[:quantity]
    product = Product.where(:id => product_id_to_add).first
    if product.present?
      guest_shopping_cart.add(product, quantity_to_add)
      status_code = 200
    else
      status_code = 404
    end
    render status: status_code, nothing: true
  end

  def index
    cart_items = guest_shopping_cart.shopping_cart_items
    render :json => as_hash(cart_items)
  end

  def update
    cart_items = request[:cart_items]
    guest_shopping_cart.update_cart_with cart_items
    render :json => as_hash(guest_shopping_cart.shopping_cart_items)
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
