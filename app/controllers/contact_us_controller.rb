class ContactUsController < ApplicationController

  before_filter :populate_root_categories

  def show
    render :show
  end

end
