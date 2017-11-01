class RemoveFreelancerfromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :freelancer_id
  end
end
