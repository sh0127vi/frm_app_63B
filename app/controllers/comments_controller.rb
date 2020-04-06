class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    comment = Comment.create(comment_params)
    if comment.save
      redirect_to product_path(@product), notice: 'コメントが送信されました'
    else
      flash.now[:alert] = 'コメントを入力してください'
      redirect_to product_path(@product)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
