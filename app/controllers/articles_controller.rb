class ArticlesController < ApplicationController
  # caches_action :show, :cache_path => Proc.new { |c| c.request.url }

  def show
    @article = Article.find(params["id"])
    @comment = Comment.new
  end
end
