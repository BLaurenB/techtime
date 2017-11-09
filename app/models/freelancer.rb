class Freelancer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  belongs_to :category
  has_many :order_freelancers
  has_many :orders, through: :order_freelancers

  enum status: ["active", "retired"]
end
