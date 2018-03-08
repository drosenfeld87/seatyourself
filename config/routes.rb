Rails.application.routes.draw do

  root 'reservations#new'

  resources :restaurants
  resources :reservations

  resource :users, only: %i(new create show) do
    resources :reservations
  end

  resource :sessions, only: %i(new create destroy)

end
