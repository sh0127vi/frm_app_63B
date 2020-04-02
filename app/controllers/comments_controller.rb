class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    comment = Comment.create(comment_params)
    redirect_to "/products/#{@product.id}"
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
