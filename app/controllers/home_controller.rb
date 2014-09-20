class HomeController < ApplicationController

  def index
    @products = Product.all
    @root_categories = Category.where(:parent => nil)
    render :home
  end

end
