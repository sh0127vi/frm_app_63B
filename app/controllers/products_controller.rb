class ProductsController < ApplicationController

  def index_Top_page
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def index_all
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def new 
    @product=Product.new
    @product.images.build
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
    params.require(:product).permit( :name, :detail, :price,:category_id,:brand_id, :condition, :city, :fee_payer, :delivery, images_attributes: [:images]).merge(user_id: current_user.id)
  end
end

