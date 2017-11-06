class Freelancer < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  validates :name, presence: true, uniqueness: true
  validates :description, :price, presence: true
  belongs_to :category
  has_many :order_freelancers
  has_many :orders, through: :order_freelancers

  enum status: ["active", "retired"]
end
