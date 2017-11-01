class CartController < ApplicationController

  def create
    freelancer = Freelancer.find(params[:freelancer_id])
    flash[:notice] = "You now have 1 hour of #{freelancer.name}'s time in your cart."
    redirect_to freelancers_path
  end

end
