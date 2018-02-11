class TransactionType < ApplicationRecord

  validates :description, presence: true, length: {minimum: 2, maximum: 10}

end
