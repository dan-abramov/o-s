class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @commentable = commentable_params[:class].find(commentable_params[:id])
    @comment = @commentable.comments.create(comment_params.merge(user_id: current_user.id))
    if @comment.save
      # redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
      respond_to do |format|
        format.js { render 'comments/create' }
      end
    else
      flash[:notice] = 'Комментарий не был создан'
    end
  end

  def update
    @commentable = commentable_params[:class].find(commentable_params[:id])
    @comment = @commentable.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to "/#{@comment.commentable_type.downcase}s/#{@comment.commentable_id}"
    else
      flash[:notice] = 'Комментарий не был обновлен'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def commentable_params
    if params.permit(:product_id).empty?
      { class: Order, id: params.permit(:order_id)[:order_id] }
    elsif params.permit(:order_id).empty?
      { class: Product, id: params.permit(:product_id)[:product_id] }
    end
  end
end
