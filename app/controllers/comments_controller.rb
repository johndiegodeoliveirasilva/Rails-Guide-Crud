class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    if @comment.save
      redirect_to @article
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
