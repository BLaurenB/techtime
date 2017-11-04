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
    params[:cart_contents].each do |freelancer_id, quantity|
      freelancer = Freelancer.find(freelancer_id.to_i)
      quantity.to_i.times do
        order.freelancers << freelancer
      end
    end
    flash[:success] = "Order was successfully placed!"
    redirect_to orders_path
  end
end
