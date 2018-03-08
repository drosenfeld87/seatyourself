class User < ApplicationRecord
  has_many :reservations
  has_many :restaurants
  has_many :visited, :through => :reservations, :source => :restaurant

  has_secure_password

  validates :email, presence: true

  def customers
    restaurants
      .flat_map(&:visitors)
      .uniq
      .sort_by(&:loyalty_points)
      .reverse
  end
end

# def customers
#   customers = []
#
#   restaurants.each do |restaurant|
#     customers += restaurant.visitors
#   end
#
#   customers.uniq.sort_by! do |customer|
#     customer.loyalty_points
#   end
#
#   customers.uniq.reverse
# end
