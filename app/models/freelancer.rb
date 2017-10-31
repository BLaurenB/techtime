class Freelancer < ApplicationRecord
  validates :name, :description, :price, presence: true

end
