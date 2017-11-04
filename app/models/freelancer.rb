class Freelancer < ApplicationRecord
  validates :name, :description, :price, presence: true
  belongs_to :category
  has_many :order_freelancers
  has_many :orders, through: :order_freelancers
end
