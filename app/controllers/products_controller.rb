class ProductsController < ApplicationController

  before_filter :populate_root_categories

  def show
    product_id = params[:id]
    @product = Product.where(:_id => product_id).first
  end

  def index
    category_id = params[:category_id]
    if category_id.present? 
      @products = filtered_products_for_category(category_id)
      render :index and return
    else
      products = Product.all
      render :json =>  products.collect { |p| generate_json_for(p) }
    end
  end

  private

  def filtered_products_for_category category_id
    Product.all and return if category_id.nil?
    @category = Category.where(:_id => category_id).first
    @root_category = @category.root
    @category.nil? ? Product.all : @category.all_products_in_hierarchy
  end

  def generate_json_for product
    {
      :details_url => url_for(product),
      :images => hash_for_images(product.images),
      :name => product.name,
      :price => product.price,
      :description => product.description,
      :category => {
        :name => product.category.name
      }
    }
  end

  def hash_for_images images
    images.collect { |img| {:img_url => image_digest_path(img.url) } }
  end

  def image_digest_path image
    ActionController::Base.helpers.asset_path(image)
  end

end
