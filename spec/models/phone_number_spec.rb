require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  it { should belong_to :phone_book }
  it { should allow_value('+12223334444').for(:number)}
  it { should_not allow_value('12223334444').for(:number)}
end
