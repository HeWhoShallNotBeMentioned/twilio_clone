require 'rails_helper'

describe 'texting page' do

  it 'sends a text message'  do
    @user = FactoryGirl.create(:user)
    @phone_book = FactoryGirl.create(:phone_book, user_id: @user.id)
    @phone_number = FactoryGirl.create(:phone_number, phone_book_id: @phone_book.id)
    visit text_messages_path
    click_on 'Sign In'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_on 'Log in'
    click_on 'New Text Message'
    select '+19087701257', from: 'text_message_to'
    fill_in 'text_message_body', with: 'This is a test.'
    click_on "Create Text message"
    expect(page).to have_content('This is a test.')
  end

end
