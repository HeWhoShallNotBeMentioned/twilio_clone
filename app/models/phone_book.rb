class PhoneBook < ActiveRecord::Base
  belongs_to :user
  has_many :phone_numbers
end
