class Admin::OrdersController < Admin::BaseController

  def index
    if params[:filter_by]
      @orders = Order.filter_by(params[:filter_by])
    else
      @orders = Order.all
    end
  end

  def update
    order = Order.find(params[:order_id])
    order.update(status: params[:status])
    redirect_to admin_dashboard_path
  end

end
