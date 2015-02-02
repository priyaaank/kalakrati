class InformationController < ApplicationController

  before_filter :populate_root_categories

  def contact
    render :contact
  end

  def about
    render :about
  end

  def tnc
    render :tnc
  end

  def privacy
    render :privacy
  end

end
