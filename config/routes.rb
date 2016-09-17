Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :trips, only: [:index, :show]

  resources :categories, only: [:show]

  resources :orders, only: [:create, :index, :show]

  namespace :admin do
    resources :orders, only: [:show]
    get '/dashboard', to: 'users#dashboard'
    get '/settings', to: 'users#edit'
    patch '/settings', to: 'users#update'
  end

  get '/cart', to: 'cart#index'
  post '/cart', to: 'cart#create'
  delete '/cart', to: 'cart#destroy'
  put '/cart', to: 'cart#update'
  get '/cart/edit', to: 'cart#edit'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#dashboard'
end
