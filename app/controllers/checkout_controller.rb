class CheckoutController < ApplicationController

  before_filter :populate_root_categories

  def address
    render :address
  end

  def payment
    render :payment
  end

  def confirm
    render :confirmation
  end

end
