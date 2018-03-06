class ReservationsController < ApplicationController

  def index
    @reservation = Reservation.new
  end

  def new

  end

  def create
    @reservation = Reservation.new
    # Uncomment below once there is a Restaurant model
    # @restaurant = Restaurant.find_by(name: params[:reservation][:restaurant_name])

    @reservation.email = params[:reservation][:email]
    @reservation.restaurant_name = params[:reservation][:restaurant_name]
    @reservation.date = params[:reservation][:date]
    @reservation.time = params[:reservation][:time]
    @reservation.number_of_people = params[:reservation][:number_of_people]

    if @reservation.time < 16 || @reservation.time >= 23
      flash[:alert] = "The reservation time must fall within open hours"
      redirect_to root_url
      return

    elsif @reservation.number_of_people > 10
      flash[:alert] = "There is not enough space for your party."
      redirect_to root_url
      return

    elsif @reservation.date < Date.today || (@reservation.date == Date.today && @reservation.time <= Time.now.hour)
      flash[:alert] = "Reservations can't be placed before an hour from now."
      redirect_to root_url
      return
    end

    if @reservation.save
      flash[:alert] = "Congratulations! Your email confirmation is on the way."
      redirect_to root_url
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
