class ProductsController < ApplicationController

  before_filter :populate_root_categories

  def show
    product_id = params[:id]
    @product = Product.where(:_id => product_id).first
  end

  def index
    category_id = params[:category_id]
    page_number = params[:page_number] || "0"
    presenter = ProductsPresenter.new(category_id, page_number.to_i)
    products = presenter.filtered_products
    products_json = products.collect { |p| generate_json_for(p) }
    render :json => { next_page: next_page_path(category_id, presenter.next_product_list_page), products: products_json}
  end

  private

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

  def next_page_path(category_id, page_number)
    return "" if page_number == -1
    category_id.present? ? category_products_page_path(category_id, page_number) : products_page_path(page_number)
  end

  def hash_for_images images
    images.collect { |img| {:img_url => img.url } }
  end

end
