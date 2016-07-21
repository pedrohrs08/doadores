class Donor
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :name, presence: true
  validates :cpf, presence: true
  validates :birth_date, presence: true
  validates :blood_type, presence: true
  validates :email, presence: true

  field :name
  field :cpf
  field :birth_date, type: Date
  field :sex
  field :blood_type
  field :email
  field :default_donation_station
  field :health_info
  field :contact

  embeds_one :address
  accepts_nested_attributes_for :address
end
