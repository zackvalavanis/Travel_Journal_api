class User < ApplicationRecord
  has_many :posts
  has_secure_password
  has_many :mes
  validates :email, presence: true, uniqueness: true
end
