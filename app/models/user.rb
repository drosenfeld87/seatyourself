class User < ApplicationRecord
  has_many :reservations
  has_many :restaurants
  # has_many :restaurants, :through => :reservations, :as => :visited
  # :foreign_key => "restaurant_id", :class_name => "Restaurant"

  has_secure_password

  validates :email, presence: true

end
