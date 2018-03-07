class ReservationsController < ApplicationController

  before_action :load_restaurants, only: [:new, :create]
  before_action :load_reservation, only: [:new, :create]

  def index

  end

  def new

  end

  def create
    # Uncomment below once there is a Restaurant model

    @reservation.email = params[:reservation][:email]
    @reservation.restaurant_name = params[:reservation][:restaurant_name]
    @reservation.date = params[:reservation][:date]
    @reservation.time = params[:reservation][:time]
    @reservation.number_of_people = params[:reservation][:number_of_people]
    @reservation.restaurant = Restaurant.find_by(restaurant_name: params[:reservation][:restaurant_name])

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

  def load_restaurants
    @restaurants = Restaurant.all
  end

  def load_reservation
    @reservation = Reservation.new
  end

end
