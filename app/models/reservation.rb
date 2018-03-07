class Reservation < ApplicationRecord

  belongs_to :restaurant

  validates :time, presence: true
  validate :restaurant_hours

  def restaurant_hours
    return unless time
    if time < 16 || time >= 23
      errors.add(:time, "must fall within open hours")
    end
  end

  # if @reservation.time < 16 || @reservation.time >= 23
  #   flash[:alert] = "The reservation time must fall within open hours"
  #
  # elsif @reservation.number_of_people > 10
  #   flash[:alert] = "There is not enough space for your party."
  #
  # elsif @reservation.date < Date.today || (@reservation.date == Date.today && @reservation.time <= Time.now.hour)
  #   flash[:alert] = "Reservations can't be placed before an hour from now."
  #   render :new
  #   return
  # end

end
