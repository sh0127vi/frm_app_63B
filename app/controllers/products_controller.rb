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
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
    @comment = @product.comments.build
  end

  def buy
  end
  
  private
end

