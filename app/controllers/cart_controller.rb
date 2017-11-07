class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
  end

  def create
    freelancer = Freelancer.find(params[:freelancer_id])

    @cart.add_freelancer(freelancer.id)
    session[:cart] = @cart.contents

    flash[:info] = "You now have #{pluralize(@cart.count_of(freelancer.id), 'hour')} of #{freelancer.name}'s time in your cart."
    redirect_to request.referer
  end

  def destroy
    freelancer = Freelancer.find(params[:freelancer_id])

    @cart.delete_freelancer(freelancer.id)
    session[:cart] = @cart.contents

    flash[:success] = "Successfully removed #{view_context.link_to "#{freelancer.name}", freelancer_path(freelancer), class: 'alert-link'} from your cart."
    redirect_to cart_path
  end

  def update
    freelancer = Freelancer.find(params[:freelancer_id])

    @cart.decrease_freelancer(freelancer.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

end
