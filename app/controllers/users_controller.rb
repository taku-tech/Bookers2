class UsersController < ApplicationController
  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books.all
  end

  def edit
  end
end
