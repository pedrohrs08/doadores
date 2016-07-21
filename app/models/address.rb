class Address
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :donor
  
  field :street
  field :number
  field :city
  field :state
  field :country
end
