class Admin::UsersController < Admin::BaseController

  def edit
  end

  def update
    current_user.update(user_params)
    flash[:success] = "You have successfully updated your account!"
    redirect_to admin_user_path(current_user)
  end

  def show
    @user = User.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :full_name, :company, :address2, :address1, :city, :state, :zip)
  end
end
