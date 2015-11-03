require 'rails_helper'

describe 'texting page' do

  it 'sends a text message' do
    visit text_messages_path
    click_on 'New Text Message'
    fill_in 'text_message_to', with: '+19087701257'
    fill_in 'text_message_from', with: '+18482316564'
    fill_in 'text_message_body', with: 'This is a test.'
    click_on "Create Text message"
    expect(page).to have_content('This is a test.')
  end

end
