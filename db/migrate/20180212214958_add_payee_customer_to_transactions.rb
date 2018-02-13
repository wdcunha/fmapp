class AddPayeeCustomerToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :payee_customer, foreign_key: true, index: true

  end
end
