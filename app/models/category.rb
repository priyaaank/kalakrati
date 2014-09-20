class Category

  include Mongoid::Document
  include Mongoid::Ancestry

  field :name, type: String
  field :description, type: String

  has_many :products

  has_ancestry

  def all_products_in_hierarchy
    products = []
    products.concat(self.products)
    products.concat(self.descendants.collect {|subcategory| subcategory.products }.flatten)
    products
  end

  def self.roots_excluding category
    ( Category.roots.not_in(:_id => category.id) || [] )
  end

end
