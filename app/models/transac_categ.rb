class TransacCateg < ApplicationRecord
  belongs_to :transaction_type
  has_many :transactions, dependent: :destroy
  
end
