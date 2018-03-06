Rails.application.routes.draw do

  root 'reservations#new'

  resources :restaurants
  resources :reservations

end
