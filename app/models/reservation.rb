class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :email, :date, :time, :number_of_people, presence: true
  validate :restaurant_hours
  validate :has_capacity
  validate :valid_date_and_time
  validate :party_size

  def restaurant_hours
    return unless time

    if time < restaurant.hours_open || time >= restaurant.hours_closed
      errors.add(:time, "must fall within open hours")
    end
  end

 def has_capacity
   return unless restaurant && number_of_people
   taken_seats = 0

   restaurant.reservations.each do |reservation|
     if reservation.date == date && reservation.time == time
       taken_seats += reservation.number_of_people
     end
   end

   remaining_seats = restaurant.capacity - taken_seats
   if number_of_people > remaining_seats
     errors.add(:number_of_people, "must be smaller")
   end

 end

 def party_size
   return unless number_of_people
   unless number_of_people >= restaurant.min_size && number_of_people <= restaurant.max_size
     errors.add(:number_of_people, "must be between #{restaurant.min_size} and #{restaurant.max_size}")
   end
 end

def valid_date_and_time
  return unless date

  if date < Date.today
    errors.add(:date, "must not be in the past")
  elsif (date == Date.today && time <= Time.now.hour)
    errors.add(:time, "must be at least an hour from right now")
  end

end

end
