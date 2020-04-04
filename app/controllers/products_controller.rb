class ProductsController < ApplicationController

  def index_Top_page
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def index_all
    @products = Product.includes(:user, :images, :purchase, :category,).order("created_at DESC")
  end

  def new 
  end

  def show
    @product = Product.find(params[:id])
    @image = @product.images.all
  end

  def buy
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    else
      render product_path(params[:id])
    end
  end
  
  private
end

