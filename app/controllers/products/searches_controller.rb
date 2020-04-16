class Products::SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @parents = Category.all.order("id ASC").limit(13)
    @products = Product.search(params[:search]).limit(132)
    @search = params[:search]
  end

  private


  def set_ransack
    @q = Product.ransack(params[:q])
  end

end
