class CommentsController < ApplicationController
  def create
    @item = Item.find(item_params[:item_id])
    @comment = @item.comments.create(comment_params)
    if @comment.save
      redirect_to @item
    else
      flash[:notice] = 'Комментарий не был создан'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @item = @comment.item
    if @comment.update(comment_params)
      redirect_to @item
    else
      flash[:notice] = 'Комментарий не был обновлен'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :item_id, :user_id)
  end

  def item_params
    params.permit(:item_id)
  end
end
