class UsersController < ApplicationController
 before_action :require_user_logged_in, only: [:index, :show]

  def index
    @users = User.order(id: desc).page(params[:page]).per(25)
  end

  def show
     @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
