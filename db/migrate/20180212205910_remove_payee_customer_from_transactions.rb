class RemovePayeeCustomerFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_reference :transactions, :payee_customer, foreign_key: true, index: true
  end
end
