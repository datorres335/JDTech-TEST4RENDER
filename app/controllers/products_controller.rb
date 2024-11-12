class ProductsController < ApplicationController
  def index
    # # TO DISPLAY PRODUCTS FROM SEARCH BAR  # CODE NOT WORKING AS OF NOW
    # if params[:search].present?
    #   @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    # else
    #   @products = Product.all
    # end
  end
end
