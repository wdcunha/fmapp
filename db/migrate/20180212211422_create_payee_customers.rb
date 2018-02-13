class CreatePayeeCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :payee_customers do |t|
      t.string :name
      t.text :address
      t.text :postaCode
      t.string :phone
      t.string :email
      t.references :payee_customer_type, foreign_key: true

      t.timestamps
    end
  end
end
