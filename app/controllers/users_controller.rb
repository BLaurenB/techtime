class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 0

    if @user.save
      flash[:success] = "Logged in as #{@user.username}"
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      render :new
      flash[:danger] = "Try again! Information is wrong."
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :full_name, :company, :address1, :address2, :city, :state, :zip)
  end
end
