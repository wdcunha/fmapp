class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.text :details
      t.date :date
      t.float :value
      t.references :transaction_type, foreign_key: true
      t.references :entity, foreign_key: true
      t.references :payee_customer, foreign_key: true
      t.references :transac_categ, foreign_key: true

      t.timestamps
    end
  end
end
