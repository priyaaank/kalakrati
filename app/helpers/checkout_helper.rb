module CheckoutHelper

  def checkout_steps
    [
      {
        :name => 'Address',
        :icon_class => "fa-map-marker",
        :section_url => checkout_address_path
      },
      {
        :name => 'Payment',
        :icon_class => "fa-money",
        :section_url => checkout_payment_path
      },
      {
        :name => 'Order',
        :icon_class => "fa-check-square",
        :section_url => ""
      }
    ]
  end

end
