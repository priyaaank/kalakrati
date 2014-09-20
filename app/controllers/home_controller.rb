class HomeController < ApplicationController

  before_filter :populate_root_categories

  def index
    @products = Product.all
    render :home
  end

end
