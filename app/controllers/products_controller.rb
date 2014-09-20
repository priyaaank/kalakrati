class ProductsController < ApplicationController

  before_filter :populate_root_categories

  def show
    product_id = params[:id]
    @product = Product.where(:_id => product_id).first
  end

  def index
    category_id = params[:category_id]
    @products = filtered_products_for_category(category_id)
  end

  private

  def filtered_products_for_category category_id
    Product.all and return if category_id.nil?
    category = Category.where(:_id => category_id)
    category.nil? ? Product.all : category.descendants.collect {|cat| cat.products}
  end

end
