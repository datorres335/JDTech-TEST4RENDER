Rails.application.routes.draw do

  devise_for :users
  get "products/index"
  root "home#home" # The home controller and home action for the root URL

  # Example resource routes (controllers and actions should exist)

  get "cart", to: "cart#show"
  get "login", to: "sessions#new"
  get "search", to: "search#search"
  resources :cart_items
  resources :products do
    # colection do
    #   post :search # CURRENTLY DO NOT HAVE A search ACTION IN THE PRODUCTS CONTROLLER, MIGHT DELETE THIS COLLECTION DO BLOCK
    # end

    # member do
    #   post 'join'
    # end
  end
  get 'my_cart', to: 'cart_items#my_cart', as: 'my_cart'
end
