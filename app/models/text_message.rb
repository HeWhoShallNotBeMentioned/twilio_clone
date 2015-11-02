class TextMessage < ActiveRecord::Base
  before_create :send_sms
  belongs_to :user

  validates :to, :presence => true
  validates :from, :presence => true
  validates :body, :presence => true

  private

  def send_sms
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    @client.account.messages.create({
      :from => from,
      :to => to,
      :body => body,
      })
   end
end
