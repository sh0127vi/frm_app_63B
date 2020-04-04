class LikesController < ApplicationController
  before_action :set_product, except: :show
  before_action :move_to_index

  def create
    @like = Like.create(user_id: current_user.id, product_id: params[:product_id])
    @likes = Like.where(product_id: params[:product_id])
    @product.reload
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
    @like.destroy
    @likes = Like.where(product_id: params[:product_id])
    @product.reload
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @like_products = @user.likes.order("created_at DESC").map{|like| like.product}
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
