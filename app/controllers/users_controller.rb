class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def show

  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def user_params
    params.require(:user).permit(:username,  :password, :password_confirmation, :name, :post_nominals)
  end

end