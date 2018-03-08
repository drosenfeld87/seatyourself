class Restaurant < ApplicationRecord

  has_many :reservations

  belongs_to :user
  # belongs_to :visited, :polymorphic => true

  validates :restaurant_name, :url, :hours_open, :hours_closed, :capacity, :address, :neighbourhood, :price_range, :summary, :restaurant_url, presence: true

  validate :restaurant_hours


  def restaurant_hours
    if hours_open >= hours_closed
      errors.add(:hours_closed, "Closing time cannot be earlier than the opening time")
    end
  end

  def available_time_slots(date)
    hours = (hours_open..hours_closed-1).to_a
    hours.select do |hour|
      number_of_people_at_this_hour = 0

      reservations.each do |reservation|
        if reservation.date == date && reservation.time == hour
          number_of_people_at_this_hour += reservation.number_of_people
        end
      end

      capacity - number_of_people_at_this_hour >= 2
    end
  end

  def next_week_reservations
    reservations.where(Date:(Date.today..Date.today + 1.week)) 
  end

end
