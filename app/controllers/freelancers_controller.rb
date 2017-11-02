class FreelancersController < ApplicationController

  def index
    @freelancers = Freelancer.all
  end

  def show
    @freelancer = Freelancer.find(params[:id])
  end

end
