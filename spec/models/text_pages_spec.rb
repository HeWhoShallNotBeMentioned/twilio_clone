require 'rails_helper'

describe TextMessage do
  it { should belong_to :user }
  it { should validate_presence_of :to }
  it { should validate_presence_of :body }

  it "doesn't save the message if twilio gives an error" do
    message = TextMessage.new(:body => "blerg", :to => "55555", from: ENV['TWILIO_FROM_NUMBER'])
    expect(message.save).to be_falsey
  end
end
