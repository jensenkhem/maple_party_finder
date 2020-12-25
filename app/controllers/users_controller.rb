class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      # Handle a save here!
    else
      # User signup fails!
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
