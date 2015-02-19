class Admin::AdminController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :set_csrf_cookie_for_ng
  before_filter :authenticate

  layout 'admin'

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def logged_in?
    not request.authorization.nil?
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_ID'] && password == ENV['ADMIN_PASSWORD']
    end
  end

end