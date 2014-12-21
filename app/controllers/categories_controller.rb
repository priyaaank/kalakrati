class CategoriesController < ApplicationController

  before_filter :populate_root_categories

  def index
    category_id = params[:category_id]
    presenter = ProductsPresenter.new(category_id, 0, 6)
    @category = presenter.category
    @products = presenter.filtered_products
    @root_category = presenter.category_root
    render :index and return if category_id.present?
  end

end