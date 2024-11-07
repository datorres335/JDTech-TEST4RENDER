Rails.application.routes.draw do
  get "products/index"
  root "home#home" # The home controller and home action for the root URL

  # Example resource routes (controllers and actions should exist)
  get 'products', to: 'products#index'
  get 'cart', to: 'cart#show'
  get 'login', to: 'sessions#new'
  get 'search', to: 'search#search'
end
