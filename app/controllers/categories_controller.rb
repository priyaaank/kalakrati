class CategoriesController < ApplicationController

  before_filter :populate_root_categories

  def index
    category_id = params[:category_id]
    page_number = params[:page_number] || 0
    presenter = ProductsPresenter.new(category_id, page_number, 6)
    @category = presenter.category
    @products = presenter.filtered_products
    @root_category = presenter.category_root
    respond_to do |format|
      format.html { render :index and return if category_id.present? }
      format.json { render json: json_response_from(@products, @category, presenter) }
    end
  end

  private

  def json_response_from products, category, presenter
    product_response = products.collect do |product|
      generate_json_for(product)
    end

    {
        products: product_response,
        total_pages: presenter.total_pages,
        current_page: presenter.page+1,
        total_records: presenter.total_products_count,
        records_per_page: presenter.records_per_page,
        product_count: product_response.size
    }
  end

  def generate_json_for product
    {
        :id => product.id.to_s,
        :details_url => url_for(product),
        :images => hash_for_images(product.images),
        :name => product.name,
        :in_stock => product.in_stock,
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
    images.collect { |img| {:img_url => img.url } }
  end

end