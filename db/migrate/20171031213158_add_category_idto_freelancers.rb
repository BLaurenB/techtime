class AddCategoryIdtoFreelancers < ActiveRecord::Migration[5.1]
  def change
    add_reference :freelancers, :category, foreign_key: true
  end
end
