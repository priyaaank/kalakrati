class OrderConfirmationMailer < ApplicationMailer

  def order_confirmation_email(order)
    @order = order
    @website_host = ActionMailer::Base.default_url_options[:host]
    mail(
        to: order.address.email,
        subject: "Kalakrati: We recieved your order [#{order.id.to_s}] of ₹#{order.total_order_amount} from #{order.address.city}",
        template_name: 'order_confirmation'
    )
  end

end
