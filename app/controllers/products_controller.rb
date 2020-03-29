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
    @product = Product.find(1)
    @image = @product.images.find(1)
  end

  def buy
  end
  
end

