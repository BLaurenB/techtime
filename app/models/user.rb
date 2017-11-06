class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, :full_name, :company, :address1, :city, :state, :zip, presence: true

  enum role: ["default", "admin"]
  has_many :orders
end
