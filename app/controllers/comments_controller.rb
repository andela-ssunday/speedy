class CommentsController < ApplicationController

  def create
    article = Article.find(params[:comment][:article_id].to_i)
    article.comments.create(comment_params)
    redirect_to articles_show_path(article)
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body, :article_id)
    end
end
