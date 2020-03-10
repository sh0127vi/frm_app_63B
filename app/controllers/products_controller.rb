class ProductsController < ApplicationController

  def index
  end

  def new 
    @product=Product.new
    @product.images.new
  end

  def show
  end

  def buy
  end
  
end

