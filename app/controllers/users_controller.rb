class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email    = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "You have successfully signup as  #{@user.first_name}!"
      # Use _url in controllers
      # Use _path in views
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.where(user_id: session[:user_id]).order(:restaurant_name)
  end

end
