class Reservation < ApplicationRecord

  belongs_to :restaurant

  validates :time, presence: true
  validate :restaurant_hours
  validate :party_size

  def restaurant_hours
    return unless time
    if time < restaurant.hours_open || time >= restaurant.hours_closed
      errors.add(:time, "must fall within open hours")
    end
  end

 def party_size
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

  # elsif @reservation.number_of_people > 10
  #   flash[:alert] = "There is not enough space for your party."
  #
  # elsif @reservation.date < Date.today || (@reservation.date == Date.today && @reservation.time <= Time.now.hour)
  #   flash[:alert] = "Reservations can't be placed before an hour from now."
  #   render :new
  #   return
  # end

end
