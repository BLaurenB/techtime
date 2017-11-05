class OrdersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @order = Order.find(params[:id])
    @freelancers = @order.freelancers
  end

  def create
    @user = current_user
    order = @user.orders.create
    order.create_orders(params[:cart_contents])
    flash[:success] = "Order was successfully placed!"
    redirect_to orders_path
  end



end
