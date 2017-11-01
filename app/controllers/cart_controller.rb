class CartController < ApplicationController
  include ActionView::Helpers::TextHelper


  def create
    freelancer = Freelancer.find(params[:freelancer_id])
    @cart.add_freelancer(freelancer.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(freelancer.id), 'hour')} of #{freelancer.name}'s time in your cart."
    redirect_to freelancers_path
  end

end
