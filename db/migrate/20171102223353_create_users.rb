class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
