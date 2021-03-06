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
    @payment = {tnc_acceptance: guest_shopping_cart.tnc_acceptance, payment_notes: guest_shopping_cart.payment_notes}
    respond_to do |format|
      format.html
      format.json {render json: @payment}
    end
  end

  def update_payment
    payment_details = request.body.read
    guest_shopping_cart.update_payment(JSON.parse(payment_details))
    order = guest_shopping_cart.generate_order
    response = { orderUrl: checkout_order_path_from(request, order) }
    NewOrderMailer.new_order_email(order).deliver
    OrderConfirmationMailer.order_confirmation_email(order).deliver
    render json: response, status: 200
  end

  def show_order
    @order = Order.where(id: params[:id]).first
    respond_to do |format|
      format.html { render :confirmation }
      format.json { render json: json_response_from(@order) }
    end
  end

  private

  def json_response_from order
    {
        id: order.id,
        currency: order.currency,
        order_items: order_items_from(order)
    }
  end

  def order_items_from order
    order.order_items.collect do |item|
      {
        name: item.product.name,
        description: item.product.description,
        price: {
            amount: item.price.amount,
            currency: item.price.currency
        },
        quantity: item.quantity,
        thumbnail_url: item.product.images.first.url,
        details_url: url_for(item.product)
      }
    end
  end

  def payment_path_from request
    request.protocol + request.host_with_port + checkout_payment_path
  end

  def checkout_order_path_from request, order
    request.protocol + request.host_with_port + checkout_order_path(order.id)
  end

end
