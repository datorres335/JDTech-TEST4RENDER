class ProductsController < ApplicationController
  before_action :set_product, only: %i[show destroy add_to_cart]
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    if params[:search].present?
      @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def create
    # Preprocess features if it's a string (from a text field input).
    processed_features = product_params[:features].is_a?(String) ? product_params[:features].split(',').map(&:strip) : product_params[:features]

    @product = Product.new(product_params.merge(features: processed_features))

    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      Rails.logger.debug @product.errors.full_messages # Log validation errors
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cart_item = CartItem.new
  end

  def add_to_cart # NOT YET IMPLEMENTED ANYWHERE
    session[:cart] ||= []
    session[:cart] << @product.id
    redirect_to product_path(@product), notice: "Product added to cart!"
  end

  def destroy
    if current_user.admin? || current_user.id == @product.user_id
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully deleted." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to products_path, alert: "You are not authorized to delete this product." }
        format.json { head :forbidden }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :user_id, :features).tap do |whitelisted|
      whitelisted[:features] = params[:product][:features].split(',').map(&:strip) if params[:product][:features].is_a?(String)
    end
  end
end
