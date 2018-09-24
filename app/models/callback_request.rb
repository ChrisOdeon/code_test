class CallbackRequest
  include ActiveModel::Model

  attr_accessor :name, :business_name, :email, :tel_number

  validates :name, :business_name, :email, :tel_number, presence: true
  validates :name, :business_name, length: 0..100
  validates :tel_number, numericality: { only_integer: true }
  validates :tel_number, length: 11..13
end