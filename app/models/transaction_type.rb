class TransactionType < ApplicationRecord
  has_many :transactions, dependent: :destroy
  validates :description, presence: true, length: {minimum: 2, maximum: 10}

end
