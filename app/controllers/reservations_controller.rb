class ReservationsController < ApplicationController

  before_action :load_restaurants, only: [:new, :create]
  before_action :load_reservation, only: [:new, :create]

  def index
    @user = User.find(session[:user_id])
    @reservations = @user.reservations
    @customers = @user.customers
    # User.all.order()
  end

  def new

  end

  def create

    @reservation.email = params[:reservation][:email]
    @reservation.restaurant_name = params[:reservation][:restaurant_name]
    @reservation.date = params[:reservation][:date]
    @reservation.time = params[:reservation][:time]
    @reservation.number_of_people = params[:reservation][:number_of_people]
    @reservation.restaurant = Restaurant.find_by(restaurant_name: params[:reservation][:restaurant_name])
    @reservation.user = User.find_by(email:params[:reservation][:email])

    if @reservation.save
      flash[:alert] = "Congratulations! Your email confirmation is on the way. Here are the details:"
      flash[:alert1] = "Restaurant: #{@reservation.restaurant_name}"
      flash[:alert2] = "Date: #{@reservation.date}"
      flash[:alert3] = "Time: #{@reservation.time}:00"
      flash[:alert4] = "Address: #{@reservation.restaurant.address}"

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
