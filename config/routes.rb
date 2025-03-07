Rails.application.routes.draw do
  get "favorites/create"
  get "favorites/destroy"
  get "profiles/show"

  devise_for :users
  get "products/index"
  root "home#home" # The home controller and home action for the root URL

  # Favorite Items
  resources :products do
    resource :favorite, only: [:create, :destroy]
  end

  # Example resource routes (controllers and actions should exist)

  get "cart", to: "cart#show"
  get "profile", to: "profiles#show"
  get 'order_history', to: 'profiles#order_history'
  get 'favorites', to: 'profiles#favorites'
  get 'account_settings', to: 'profiles#account_settings'
  get 'start_return', to: 'profiles#start_return'
  get 'contact_us', to: 'profiles#contact_us'
  get 'logout', to: 'profiles#logout'
  get "login", to: "sessions#new"
  get "search", to: "search#search"
  post 'send_contact', to: 'profiles#send_contact'
  resources :cart_items
  resources :products
  get 'my_cart', to: 'cart_items#my_cart', as: 'my_cart'
end
