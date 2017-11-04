class Order < ApplicationRecord
  belongs_to :user
  has_many :order_freelancers
  has_many :freelancers, through: :order_freelancers
end
