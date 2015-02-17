class Image

  include Mongoid::Document

  embedded_in :product

  field :url, type: String
  field :primary, type: Boolean
  field :public_id, type: String

end
