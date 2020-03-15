class ProductsController < ApplicationController

  def index
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

