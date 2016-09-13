Rails.application.routes.draw do
  resources :trips, only: [:index, :show]

  resources :categories, only: [:show]

  resources :carts, only: [:create, :index]
end
