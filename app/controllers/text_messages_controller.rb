class TextMessagesController < ApplicationController

  def index
    @text_messages = TextMessage.all
  end

  def new
    @text_message = TextMessage.new
    respond_to do |format|
      format.js
      format.html {render :new}
    end
  end

  def create
    @text_message = TextMessage.new(text_message_params)

    # @client = Twilio::REST::Client.new 'AC019d639b2379830d30d2ed5338e20d13', '31b200194a4ba36aa95c02d19d3b0e99'
    #
    # @client.account.messages.create({
    #   :from => text_message_params['from'],
    #   :to => text_message_params['to'],
    #   :body => text_message_params['body'],
    #   })

    if @text_message.save
      flash[:notice] = "Text Message saved and sent."
      respond_to do |format|
        format.js
        format.html {redirect_to text_messages_path}
      end
    else
      flash[:alert] = "Text Message was not save and will not be sent."
      respond_to do |format|
        format.js
        format.html {render :new}
      end
    end
  end

  private

  def text_message_params
    params.require(:text_message).permit(:to, :from, :body, :status)
  end
end
