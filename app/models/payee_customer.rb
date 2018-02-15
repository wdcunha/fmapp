class PayeeCustomer < ApplicationRecord
  belongs_to :payee_customer_type
  has_many :transactions, dependent: :destroy
end
