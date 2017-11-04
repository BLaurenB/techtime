class OrdersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @order = Order.find(params[:id])
    @freelancers = @order.freelancers
  end

  def create

    flash[:success] = "Order was successfully placed!"
    redirect_to orders_path
  end
end
