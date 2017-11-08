class Order < ApplicationRecord
  belongs_to :user
  has_many :order_freelancers
  has_many :freelancers, through: :order_freelancers

  enum status: ["Ordered", "Paid", "Cancelled", "Completed"]

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

  def create_orders(cart_contents)
    cart_contents.each do |freelancer_id, quantity|
      freelancer = Freelancer.find(freelancer_id.to_i)
      quantity.to_i.times do
        self.freelancers << freelancer
      end
    end
  end


  def self.total_ordered
    where(status: 0).count
  end

  def self.total_paid
    where(status: 1).count
  end

  def self.total_cancelled
    where(status: 2).count
  end

  def self.total_completed
    where(status: 3).count
  end

  def self.filter_by(status_params)
    where(status: status_params)
  end

  def self.orders_by_id
    order(:id)
  end
end
