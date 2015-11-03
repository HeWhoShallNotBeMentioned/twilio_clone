class TextMessage < ActiveRecord::Base
  before_create :send_sms
  belongs_to :user

  validates :to, :presence => true

  validates :body, :presence => true

  private

  def send_sms
    begin
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      @client.account.messages.create({
        :from => ENV['TWILIO_FROM_NUMBER'],
        :to => to,
        :body => body,
        })
      rescue
        false
      end
  end

end
