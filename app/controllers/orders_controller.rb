class OrdersController < ApplicationController

  def index
    @user = current_user
  end

  def show
    if current_user.id != Order.find(params[:id]).user_id
      render file: "public/404"
    else
      @order = current_user.orders.find(params[:id])
      @freelancers = @order.freelancers
    end
  end

  def create
    @user = current_user
    order = @user.orders.create
    order.create_orders(params[:cart_contents])
    flash[:success] = "Order was successfully placed!"
    session[:cart].clear
    redirect_to orders_path
  end

end
