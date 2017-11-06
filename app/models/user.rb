class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates :email, :full_name, :company, :address1, :city, :state, :zip, presence: true

  enum role: ["default", "admin"]
end
