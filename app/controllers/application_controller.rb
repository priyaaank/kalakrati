class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def populate_root_categories
    @root_categories = Category.roots
  end

  def lookup_and_create_cart
    @cart_id = cookies[:guest_cart_id] and return if cookies[:guest_cart_id].present?
    guest_cart = ShoppingCart.create!
    cookies[:guest_cart_id] = { value: guest_cart.id, expires: 1.year.from_now }
    @cart_id = guest_cart.id
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

end
