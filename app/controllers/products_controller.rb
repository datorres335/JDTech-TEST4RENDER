class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :add_to_cart]

  def index
    # # TO DISPLAY PRODUCTS FROM SEARCH BAR  # CODE NOT WORKING AS OF NOW
    # if params[:search].present?
    #   @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    # else
    #   @products = Product.all
    # end
    
    @products = Product.all
  end

  def show
  end

  def add_to_cart
    # Implement your logic for adding the product to the cart here
    # For example, storing the product ID in a session:
    session[:cart] ||= []
    session[:cart] << @product.id
    redirect_to product_path(@product), notice: 'Product added to cart!'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :description, features: [])
  end
end
