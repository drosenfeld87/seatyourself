class ReservationsController < ApplicationController

  def index

  end

  def new
    @reservation = Reservation.new
    @restaurants = Restaurant.all
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

    if @reservation.save
      flash[:alert] = "Congratulations! Your email confirmation is on the way."
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
