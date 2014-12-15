class Price

  module Symbol
    INR = "₹"
  end

  include Mongoid::Document

  embedded_in :order_item
  embedded_in :product

  field :amount, type: BigDecimal
  field :currency, type: String, default: Symbol::INR

end