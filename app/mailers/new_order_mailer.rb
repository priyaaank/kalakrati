class NewOrderMailer < ApplicationMailer

  def new_order_email(order)
    @order = order
    mail(
      to: "kalakrati@outlook.com",
      subject: "New Order [#{order.id.to_s}] of ₹#{order.total_order_amount} from #{order.address.city}",
      template_name: 'new_order'
    )
  end

end
