class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :phone, presence: false
  validates :email, presence: true, uniqueness: true
end
