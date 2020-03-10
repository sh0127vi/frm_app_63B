class ProductsController < ApplicationController

  def index
  end

  def new 
    @product=Product.new
    @product.image.new
  end

  def show
  end

  def buy
  end
  
end

