class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @user = current_user
    @new_post = Book.new
  end

  def show
  	@new_post = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books.all
  end

  def edit
  	@user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :introduction, :profile_image)
  	end

end