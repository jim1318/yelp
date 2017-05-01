class SessionsController < ApplicationController

  def new
    redirect_to home_path if current_user 
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've logged in"
      redirect_to home_path
    else
        flash[:danger] = "something wrong with login credentials"
        redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You've Logged Out"
    redirect_to root_path
  end


end