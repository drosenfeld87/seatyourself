Rails.application.routes.draw do

  root 'reservations#new'

  resources :reservations

end
