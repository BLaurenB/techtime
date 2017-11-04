class Order < ApplicationRecord
  belongs_to :user
  has_many :order_freelancers
  has_many :freelancers, through: :order_freelancers


  def grouped_freelancers
    freelancers.group(:id).count
  end

  def subtotal(id, quantity)
    quantity * freelancers.find(id).price
  end


  def total
    grouped_freelancers.map do |id, quantity|
      quantity * freelancers.find(id).price
    end.sum
  end


end
