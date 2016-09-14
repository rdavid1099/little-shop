Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :trips, only: [:index, :show]

  resources :categories, only: [:show]

  get '/cart', to: 'cart#index'
  post '/cart', to: 'cart#create'
  delete '/cart', to: 'cart#destroy'
  resources :carts, only: [:create, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#dashboard'
end
