class Image

  include Mongoid::Document

  field :url, type: String
  field :primary, type: Boolean

end
