class UsersController < ApplicationController
  before_action :authenticate, :except => [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully signed up!"
      redirect_to root_path
    else
      # User signup fails!
      render 'new'
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
