class PhoneNumbersController < ApplicationController

  def new
    @user = current_user
    @phone_book = @user.phone_book
    if @phone_book
      @phone_number = PhoneNumber.new
    else
      @phone_book = PhoneBook.create
      @phone_book["user_id"] = @user.id
      @phone_book.save
      @phone_number = PhoneNumber.new
    end
  end

  def create
    @user = current_user
    @phone_book = @user.phone_book
    @phone_number = PhoneNumber.new(phone_number_params)
    @phone_number['phone_book_id'] = @phone_book.id
    if @phone_number.save
      redirect_to user_phone_books_path(@user)
    else
      render :new
    end
  end

  private
    def phone_number_params
      params.require(:phone_number).permit(:number, :phone_book_id)
    end
end
