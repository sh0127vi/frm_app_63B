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
  end

  def buy
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end
  
end

