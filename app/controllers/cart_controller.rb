class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  before_action :collect_freelancers, only: [:show]

  def show
  end

  def create
    freelancer = Freelancer.find(params[:freelancer_id])

    @cart.add_freelancer(freelancer.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(freelancer.id), 'hour')} of #{freelancer.name}'s time in your cart."
    redirect_to freelancers_path
  end

  private

  def collect_freelancers
    @freelancers = Freelancer.where(id: @cart.freelancer_ids)
  end
end
