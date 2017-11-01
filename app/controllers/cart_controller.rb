class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def show
  end

  def create
    freelancer = Freelancer.find(params[:freelancer_id])

    @cart.add_freelancer(freelancer.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(freelancer.id), 'hour')} of #{freelancer.name}'s time in your cart."
    redirect_to freelancers_path
  end

  def destroy
    freelancer = Freelancer.find(params[:freelancer_id])

    @cart.delete_freelancer(freelancer.id)
    session[:cart] = @cart.contents


    flash[:notice] = "Successfully removed #{freelancer.name} from your cart."
    redirect_to cart_path

  end

end
