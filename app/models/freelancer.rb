class Freelancer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, :price, presence: true
  belongs_to :category
  has_many :order_freelancers
  has_many :orders, through: :order_freelancers

  enum status: ["active", "retired"]
end
