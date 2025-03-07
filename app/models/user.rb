class User < ApplicationRecord
  # Include default Devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items

  # Favorite products
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product

  # Set a default value for the admin attribute when a new record is created
  after_initialize :set_default_admin, if: :new_record?

  def set_default_admin
    self.admin ||= false
  end
end
