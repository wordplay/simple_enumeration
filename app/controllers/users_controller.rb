class UsersController < ApplicationController
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    @user.status = :active

    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
 
  def index
    @users = User.all
  end
 
  private
  def user_params
    params.require(:user).permit(:username)
  end
end
