class Product

  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :price, type: BigDecimal
  field :code, type: String

  embeds_many :tags
  embeds_many :images
  belongs_to :category


  def primary_image
    images.select {|img| img.primary }.first
  end

end