class UsersController < ApplicationController
  def index
    @users = User.all

    @user = current_user
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @newbook = Book.new

    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title ,:body)
  end

end
