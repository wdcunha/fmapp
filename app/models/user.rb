class User < ApplicationRecord
  before_save   :downcase_email

  has_many :usings, dependent: :destroy
  has_many :entities, through: :usings

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end


  private

  def downcase_email
    self.email = email.downcase
  end

end
