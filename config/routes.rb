Rails.application.routes.draw do

  root 'reservations#index'
  resources :restaurants
  resources :reservations

end
