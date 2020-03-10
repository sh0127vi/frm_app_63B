class ProductsController < ApplicationController

  def index
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
  end

  def buy
  end
  
  private

  def product_params
    params.require(:product).permit(:user_id, :category_id, :name, :detail, :price, :condition, :city, :delivery, :fee_payer, :delivery_area, images_attributes: [:images])
  end
end

