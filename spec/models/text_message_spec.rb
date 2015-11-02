require 'rails_helper'

describe TextMessage do
  it { should belong_to :user }
  it { should validate_presence_of :to }
  it { should validate_presence_of :from }
  it { should validate_presence_of :body }
end
