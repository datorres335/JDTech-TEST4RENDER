class Product < ApplicationRecord
  has_one_attached :image
  #Cart items
  has_many :cart_items
  # Favorites 
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
end
