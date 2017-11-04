class ChangeStatusColumnOnOrders < ActiveRecord::Migration[5.1]
  def change
    execute 'ALTER TABLE orders ALTER COLUMN status TYPE integer USING (status::integer)'
  end
end
