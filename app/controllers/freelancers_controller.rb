class FreelancersController < ApplicationController

  def index
    @freelancers = Freelancer.all
  end

end
