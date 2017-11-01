class FreelancersController < ApplicationController

  def index
    @freelancers = Freelancer.all
    @cart = Cart.new(session[:cart])
  end

end
