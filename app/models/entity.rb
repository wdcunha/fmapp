class Entity < ApplicationRecord

  has_many :usings, dependent: :destroy
  has_many :users, through: :usings

end
