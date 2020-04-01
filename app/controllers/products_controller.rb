class ProductsController < ApplicationController

  def index_Top_page
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def index_all
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def new 
    @product=Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @image = @product.images.all
  end

  def buy
  end
  
  private

  def product_params
    params.require(:product).permit(:user_id, :category_id, :name, :detail, :price, :condition, :city, :delivery, :fee_payer, :delivery_area, images_attributes: [:images])
  end
end

