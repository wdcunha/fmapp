class RemoveUserFromTransactionTypes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :transaction_types, :user, foreign_key: true, index: true
  end
end
