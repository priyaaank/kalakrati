class Category

  include Mongoid::Document
  include Mongoid::Ancestry

  field :name, type: String
  field :description, type: String

  has_many :products

  has_ancestry

end
