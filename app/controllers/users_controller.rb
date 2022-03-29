class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.find(params(:id))
  end

    private

  def user_params
      params.permit(:name, :email, :password,
      :password_confirmation)
  end
end
