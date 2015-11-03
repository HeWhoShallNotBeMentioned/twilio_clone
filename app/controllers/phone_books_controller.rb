class PhoneBooksController < ApplicationController
  def index
    @user = current_user
    @phone_book = current_user.phone_book
  end
end
