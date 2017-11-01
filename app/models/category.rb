class Category < ApplicationRecord

  validates :title, presence: true
  has_many :freelancers

  before_save :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end  
end
