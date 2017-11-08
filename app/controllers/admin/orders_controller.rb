class Admin::OrdersController < Admin::BaseController

  def index
    @all_orders = Order.all
    if params[:filter_by]
      @orders = Order.filter_by(params[:filter_by])
    else
      @orders = Order.orders_by_id
    end
  end


  def show
    @order = Order.find(params[:id])
    @freelancers = @order.freelancers
  end


  def update
    order = Order.find(params[:order_id])
    order.update(status: params[:status])
    redirect_to admin_dashboard_path
  end


end
