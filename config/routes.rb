Rails.application.routes.draw do

  root 'reservations#new'

  resources :restaurants
  resources :reservations
  resource :users, only: %i(new create)
  resource :sessions, only: %i(new create destroy)

end
