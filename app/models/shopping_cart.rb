class ShoppingCart

  include Mongoid::Document

  has_many :shopping_cart_items
  embeds_one :address

  def add(product, quantity=1)
    shopping_cart_item = shopping_cart_items.find_or_create_by(product_id: product.id)
    shopping_cart_item.quantity += quantity
    shopping_cart_item.save!
  end

  def delete cart_item
    shopping_cart_items.destroy_all(id: cart_item.id)
  end

  def update_cart_with items
    items_to_delete = deleted_item_ids(items)
    delete_removed_cart_items(items_to_delete)
    update_quantities_for(items)
  end

  def update_address address
    puts "updating address for shopping cart id: #{self.id}"
    puts address.inspect
    self.update_attribute(:address, address)
  end

  private

  def update_quantities_for items
    items.each do |item|
      cart_item = shopping_cart_items.where(:id => item["id"]).first
      if cart_item.present? && cart_item.quantity.to_s != item["quantity"].to_s
        cart_item.update_attribute(:quantity, item["quantity"])
      end
    end
  end

  def delete_removed_cart_items item_ids
    return if item_ids.empty?
    shopping_cart_items.destroy_all(:id.in => item_ids)
  end

  def deleted_item_ids items
    id_extractor = lambda { |item| item["id"] }
    deleted_ids = shopping_cart_items.map{|item| item.id.to_s} - items.map(&id_extractor)
    items_with_zero_quantity = items.select {|item| item["quantity"].to_s == "0" }.map(&id_extractor)
    deleted_ids.concat(items_with_zero_quantity)
  end

end
