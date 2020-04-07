class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
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