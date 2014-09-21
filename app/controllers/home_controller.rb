class HomeController < ApplicationController

  before_filter :lookup_and_create_cart, only: [:index]
  before_filter :populate_root_categories

  def index
    @products = Product.all
    render :home
  end


end
