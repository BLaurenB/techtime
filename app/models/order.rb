class Order < ApplicationRecord
  belongs_to :user
  has_many :order_freelancers
  has_many :freelancers, through: :order_freelancers

  # we need to find the quantity of freelancers for a specific order

  # def quantity
  # freelancers.group(:id).count
  # freelancer 1 is bought twice
  # {1 => 2, 2 => 1, 3 => 3}
  #end

  # def quantity_of_freelancer(id)

  # we're not sure how to pass this info to the view since we're thinking about doing @order.freelancers.each do |freelancer| to be able to access the freelancer information (name, price)

  def grouped_freelancers
    freelancers.group(:id).count
  end


end
