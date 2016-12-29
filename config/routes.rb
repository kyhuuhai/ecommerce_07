Rails.application.routes.draw do
  root "static_pages#home"

  get "register", to: "users#new"
  get "register", to: "users#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :carts
  resources :cartdetails, only: [:create, :update, :destroy]
  resources :users
  resources :products
end
