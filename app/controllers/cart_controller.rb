class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:freelancer_id].to_s
    freelancer = Freelancer.find_by(id: id)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    flash[:notice] = "You now have #{pluralize(session[:cart][id], 'hour')} of #{freelancer.name}'s time in your cart."
    redirect_to freelancers_path
  end

end
