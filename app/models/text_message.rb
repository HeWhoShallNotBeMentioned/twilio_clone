class TextMessage < ActiveRecord::Base
  before_create :send_sms
  belongs_to :user

  validates :to, :presence => true
  validates :from, :presence => true
  validates :body, :presence => true

  private
  def toArray(str)
    if str.scan(/,/)
      str = str.split(',')
    else
      str
    end
  end

  def send_sms
    if to.toArray.length
      to.toArray.each do |single_to|
        begin
          @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
          @client.account.messages.create({
            :from => from,
            :to => single_to,
            :body => body,
            })
          rescue
            false
          end
        end
      end
    else
      begin
      @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      @client.account.messages.create({
        :from => from,
        :to => to,
        :body => body,
        })
      rescue
        false
      end
    end
end
