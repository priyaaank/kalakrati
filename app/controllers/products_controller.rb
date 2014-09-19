class ProductsController < ApplicationController

  def show
    product_id = params[:id]
    @product = Product.where(:_id => product_id).first
  end

end
