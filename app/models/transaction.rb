class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :entity
  belongs_to :payee_customer
  belongs_to :transac_categ
end
