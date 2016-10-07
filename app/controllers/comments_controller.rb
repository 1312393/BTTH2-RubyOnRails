class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article

    @user = current_user
    @comment.user = @user
    print [@comment]
    if @comment.save
      redirect_to article_path(@article)
    else
      flash.now[:danger] = "error"
    end
  end
  def new

  end
  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
