class ReservationsController < ApplicationController

  before_action :load_restaurants, only: [:new, :create]
  before_action :load_reservation, only: [:new, :create]

  def index
    @user = User.find(session[:user_id])
    @reservations  = @user.reservations
  end

  def new

  end

  def create
    # binding.pry
    # Uncomment below once there is a Restaurant model

    @reservation.email = params[:reservation][:email]
    @reservation.restaurant_name = params[:reservation][:restaurant_name]
    @reservation.date = params[:reservation][:date]
    @reservation.time = params[:reservation][:time]
    @reservation.number_of_people = params[:reservation][:number_of_people]
    @reservation.restaurant = Restaurant.find_by(restaurant_name: params[:reservation][:restaurant_name])

    if @reservation.save
      flash[:alert] = "Congratulations! Your email confirmation is on the way."

      if current_user
        user = User.find(session[:user_id])
        user.loyalty_points += 10
        user.save
      end

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
