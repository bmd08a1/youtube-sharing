class User < ApplicationRecord
  validates :name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :posts
end
