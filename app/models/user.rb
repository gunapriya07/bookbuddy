class User < ApplicationRecord
  has_secure_password
  has_many :books, dependent: :destroy
  has_many :reviews, through: :books
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
