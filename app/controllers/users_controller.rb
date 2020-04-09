class UsersController < ApplicationController

  before_action :require_login, only: [:index, :show, :edit, :update]

  def index
    @users = User.all
  end
  
  def new
    redirect_back(fallback_location: root_path) if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    if params[:id].to_i == current_user.id
      @user = @current_user #User.find_by_id(params[:id])
    else
      redirect_back(fallback_location: user_path(params[:id]))
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def delete

  end

  private

  def user_params
    params.require(:user).permit(:username,  :password, :password_confirmation, :name, :post_nominals)
  end

end