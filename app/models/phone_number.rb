class PhoneNumber < ActiveRecord::Base
  has_one :user, through: :phone_book
  belongs_to :phone_book

  validates :number, format: { with: /(\+1)(\d{10})/, message: "incorrect phone number format" }
end
