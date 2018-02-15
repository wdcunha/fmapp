class PayeeCustomerType < ApplicationRecord
  has_many :payee_customer_types, dependent: :destroy
end
