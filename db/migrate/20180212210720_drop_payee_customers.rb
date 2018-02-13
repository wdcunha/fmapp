class DropPayeeCustomers < ActiveRecord::Migration[5.1]
  def change
    drop_table :payee_customers
  end
end
