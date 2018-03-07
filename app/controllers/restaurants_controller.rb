class RestaurantsController < ApplicationController
  before_action :load_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.restaurant_name = params[:restaurant][:restaurant_name]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.hours_open = params[:restaurant][:hours_open]
    @restaurant.hours_closed = params[:restaurant][:hours_closed]
    @restaurant.url = params[:restaurant][:url]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.neighbourhood = params[:restaurant][:neighbourhood]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.restaurant_url = params[:restaurant][:restaurant_url]

    if @restaurant.save
      # if the restaurant gets saved, generate a get request to "/restaurants" (the index)
      redirect_to "/restaurants"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def show
    @reservation = Reservation.new

  end

  def edit

  end

  def update
    @restaurant.restaurant_name = params[:restaurant][:restaurant_name]
    @restaurant.capacity = params[:restaurant][:capacity]
    @restaurant.hours_open = params[:restaurant][:hours_open]
    @restaurant.hours_closed = params[:restaurant][:hours_closed]
    @restaurant.url = params[:restaurant][:url]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.neighbourhood = params[:restaurant][:neighbourhood]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.restaurant_url = params[:restaurant][:restaurant_url]

    if @restaurant.save
      redirect_to "/restaurants/#{@restaurant.id}"
    else
      render :edit
    end

  end

  def destroy
    @restaurant.destroy
    redirect_to "/restaurants"
  end

  def load_restaurant
     @restaurant = Restaurant.find(params[:id])
  end

end
