class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to product_path(@product), notice: 'コメントが送信されました'
    else
      redirect_to product_path(@product), alert: 'コメントを入力してください'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
