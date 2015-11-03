class PhoneNumber < ActiveRecord::Base
  has_one :user, through: :phone_book
  belongs_to :phone_book
end
