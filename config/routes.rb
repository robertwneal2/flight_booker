Rails.application.routes.draw do
  resources :flights
  get 'search', to: 'flights#search'
  resources :airports
  root "flights#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
