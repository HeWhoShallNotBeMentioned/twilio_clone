require 'rails_helper'

describe User do
  it { should have_many :text_messages }
  it { should have_one :phone_book }
end
