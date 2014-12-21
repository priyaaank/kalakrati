class CategoriesController < ApplicationController

  before_filter :populate_root_categories

  def index
    category_id = params[:category_id]
    presenter = ProductsPresenter.new(category_id, 0, 6)
    @category = presenter.category
    @products = presenter.filtered_products
    @root_category = presenter.category_root
    respond_to do |format|
      format.html { render :index and return if category_id.present? }
      format.json { render json: json_response_from(@products, @category) }
    end
  end

  private

  def json_response_from products, category
    product_response = products.collect do |product|
      generate_json_for(product)
    end

    { products: product_response }
  end

  def generate_json_for product
    {
        :id => product.id.to_s,
        :details_url => url_for(product),
        :images => hash_for_images(product.images),
        :name => product.name,
        :price => {
            amount: product.price.amount,
            currency: product.price.currency
        },
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