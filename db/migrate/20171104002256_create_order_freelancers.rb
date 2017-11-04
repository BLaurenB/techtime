class CreateOrderFreelancers < ActiveRecord::Migration[5.1]
  def change
    create_table :order_freelancers do |t|
      t.references :freelancer, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
