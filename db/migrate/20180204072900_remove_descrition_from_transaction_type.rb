class RemoveDescritionFromTransactionType < ActiveRecord::Migration[5.1]
  def change
    remove_column :transaction_types, :descrition, :text
    add_column :transaction_types, :description, :text

  end
end
