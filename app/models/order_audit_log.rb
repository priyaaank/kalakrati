class OrderAuditLog

  include Mongoid::Document

  embedded_in :order

  field :from, type: String
  field :to, type: String
  field :event, type: String
  field :when, type: Time

end