class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    current_user.favorites.create(product: @product)
    redirect_to @product, notice: 'Product has been added to your favorites.'
  end

  def destroy
    @product = Product.find(params[:product_id])
    current_user.favorites.find_by(product: @product).destroy
    redirect_to @product, notice: 'Product has been removed from your favorites.'
  end
end