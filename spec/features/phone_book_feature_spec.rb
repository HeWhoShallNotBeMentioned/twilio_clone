require 'rails_helper'

describe 'phone book page' do
  it "adds a phone number" do
    @user = FactoryGirl.create(:user)
    @phone_book = FactoryGirl.create(:phone_book, user_id: @user.id)
    visit text_messages_path
    click_on 'Sign In'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_on 'Log in'
    visit user_phone_books_path(@user)
    click_on "Add a Phone Number"
    fill_in 'Number', with: '+12223334444'
    click_on "Create Phone number"
    expect(page).to have_content("+12223334444")
  end
end
