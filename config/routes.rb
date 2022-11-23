Rails.application.routes.draw do
  resources :flights
  get 'search', to: 'flights#search'
  resources :airports
  resources :bookings, only: [:new, :create, :show]

  root "flights#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
