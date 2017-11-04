class AddStatusToFreelancers < ActiveRecord::Migration[5.1]
  def change
    add_column :freelancers, :status, :integer, default: 0
  end
end
