class Admin::OrdersController < Admin::BaseController

  def index
    if params[:filter_by]
      @orders = Order.filter_by(params[:filter_by])
    else
      @orders = Order.all
    end
  end

  def show
    @order = Order.find(params[:id])
    @freelancers = @order.freelancers
  end


end
