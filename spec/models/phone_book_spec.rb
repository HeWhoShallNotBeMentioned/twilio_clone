require 'rails_helper'

RSpec.describe PhoneBook, type: :model do
  it { should belong_to :user}
  it { should have_many :phone_numbers }
end
