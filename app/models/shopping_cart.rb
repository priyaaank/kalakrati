class ShoppingCart

  include Mongoid::Document

  has_many :shopping_cart_items

  def add(product, quantity=1)
    shopping_cart_item = shopping_cart_items.find_or_create_by(product_id: product.id)
    shopping_cart_item.quantity += quantity
    shopping_cart_item.save!
  end

end
