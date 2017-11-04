class OrdersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @order = Order.find(params[:id])
    @freelancers = @order.freelancers
  end

end
