Rails.application.routes.draw do
  resources :flights
  # get 'flights/search', to: 'flights#search'
  resources :airports
  root "flights#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
