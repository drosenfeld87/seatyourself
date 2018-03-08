class Restaurant < ApplicationRecord

  has_many :reservations

  belongs_to :user

  validates :restaurant_name, :url, :hours_open, :hours_closed, :capacity, :address, :neighbourhood, :price_range, :summary, :restaurant_url, presence: true

  validate :restaurant_hours


  def restaurant_hours
    if hours_open >= hours_closed
      errors.add(:hours_closed, "Closing time cannot be earlier than the opening time")
    end
  end

end
