class SessionsController < ApplicationController
  # include SessionsHelper
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log in the user!
      login(user)
      flash[:success] = "Logged in!"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid login!"
      render 'new' 
    end
  end
  def destroy
    log_out
    flash[:danger] = "Logged out!"
    redirect_to root_path
  end
end
