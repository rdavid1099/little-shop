class User < ActiveRecord::Base
  has_secure_password
  has_many :orders

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
end
