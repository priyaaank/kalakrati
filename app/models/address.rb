class Address 

  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :address_line1, type: String
  field :address_line2, type: String
  field :email, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :zipcode, type: String
  field :additional_info, type: String
  field :mobile, type: String

  embedded_in :order
  embedded_in :shopping_cart

  def self.from_details address
    Address.new(
      first_name: address["first_name"],
      last_name: address["last_name"],
      address_line1: address["address_line1"],
      address_line2: address["address_line2"],
      email: address["email"],
      city: address["city"],
      state: address["state"],
      country: address["country"],
      zipcode: address["zipcode"],
      additional_info: address["additional_info"],
      mobile: address["mobile"])
  end

end
