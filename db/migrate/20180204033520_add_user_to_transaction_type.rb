class AddUserToTransactionType < ActiveRecord::Migration[5.1]
  def change
    add_reference :transaction_types, :user, foreign_key: true, index: true
  end
end
