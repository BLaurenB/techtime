class CartsController < ApplicationController

  def create
    @cart = Cart.new()
  end 

end
