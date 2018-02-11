class CreateTransacCategs < ActiveRecord::Migration[5.1]
  def change
    create_table :transac_categs do |t|
      t.string :title
      t.text :description
      t.references :transaction_type, foreign_key: true

      t.timestamps
    end
  end
end
