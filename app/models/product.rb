class Product

  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :code, type: String
  field :in_stock, type: Boolean, default: true

  embeds_many :tags
  embeds_many :images, cascade_callbacks: true
  embeds_one  :price
  belongs_to  :category

  scope :newest_first, ->  { order(id: :desc) }

  accepts_nested_attributes_for :price
  accepts_nested_attributes_for :images

  validates_presence_of :name, :description, :code

  def primary_image
    images.select {|img| img.primary }.first
  end

  def update_images image_metadata
    if image_metadata.present?
      image_metadata.each do |metadata|
        images << Image.new(url: metadata["url"], primary: false, public_id: metadata["public_id"])
      end
      images.each_with_index { |img, index| img.primary = (index == 0) }
      self.save!
    end
  end

end
