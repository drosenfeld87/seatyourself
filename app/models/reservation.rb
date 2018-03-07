class Reservation < ApplicationRecord

  belongs_to :restaurant
  validates :email, :date, :time, :number_of_people, :restaurant_name, presence: true
  validate :restaurant_hours
  validate :party_size
  validate :valid_date_and_time

  def restaurant_hours
    return unless time
    
    if time < restaurant.hours_open || time >= restaurant.hours_closed
      errors.add(:time, "must fall within open hours")
    end
  end

 def party_size
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

def valid_date_and_time
  return unless date

  if date < Date.today
    errors.add(:date, "must not be in the past")
  elsif (date == Date.today && time <= Time.now.hour)
    errors.add(:time, "must be at least an hour from right now")
  end

end

end
