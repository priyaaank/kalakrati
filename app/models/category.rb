class Category

  include Mongoid::Document
  include Mongoid::Ancestry

  field :name, type: String
  field :description, type: String
  field :image_url, type: String
  field :image_source, type: String
  field :menu_image, type: String

  has_many :products

  has_ancestry

  def all_products_in_hierarchy
    products = []
    products.concat(self.products)
    products.concat(self.descendants.collect {|subcategory| subcategory.products }.flatten)
    products
  end

  def display_image
    (self.image_url || self.root.image_url || "")
  end

  def display_image_source
    (self.image_source || self.root.image_source || "")
  end

end
