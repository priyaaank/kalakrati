class MarkProductsAsInStockAsDefault < Mongoid::Migration
  def self.up
    Product.update_all(:in_stock => true)
  end

  def self.down
    Product.update_all(:in_stock => '')
  end
end