class User < ApplicationRecord
  has_many :reservations
  has_secure_password

  validates :email, presence: true

end
