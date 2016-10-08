class CommentsController < ApplicationController
  def create

    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article)
    else
      flash.now[:danger] = "error"
    end
  end

  private
  def comment_params
    params.require(:comment).permit( :body)
  end
end
