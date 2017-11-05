class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.username}"
      if user.admin?
        redirect_to '/admin/dashboard'
      else
        redirect_to '/dashboard'
      end
    else
      render :new
      flash[:notice] = "Something went wrong! Please try again"
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
