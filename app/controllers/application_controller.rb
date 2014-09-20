class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def populate_root_categories
    @root_categories = Category.where(:parent => nil)
  end
end
