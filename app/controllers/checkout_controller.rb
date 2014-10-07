class CheckoutController < ApplicationController

  before_filter :lookup_and_create_cart
  before_filter :populate_root_categories

  def address
    @address = guest_shopping_cart.address || {}
    respond_to do |format|
      format.html
      format.json {render json: @address}
    end
  end

  def create_address
    status_code = 200
    response = ""
    address_hash = request.body.read
    address = Address.from_details(JSON.parse(address_hash))
    if address.valid?
      guest_shopping_cart.update_address(address)
      response = { paymentUrl: payment_path_from(request) }
    else
      response = { error: "Address details are not valid" }
      status_code = 400
    end
    render json: response, status: status_code
  end

  def payment
    render :payment
  end

  def confirm
    render :confirmation
  end

  private

  def payment_path_from request
    request.protocol + request.host_with_port + checkout_payment_path
  end

end
