class Admin::UsersController < Admin::BaseController

  def edit
  end

  def update
    current_user.update(user_params)
    flash[:success] = "You have successfully updated your account!"
    redirect_to admin_user_path(current_user)
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :company, :address2, :address1, :city, :state, :zip)
  end  
end
