class Freelancer < ApplicationRecord
  validates :name, :description, :price, presence: true
  belongs_to :category
end
