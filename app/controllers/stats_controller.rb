class StatsController < ApplicationController
  # caches_action :index

  def index
    @five_longest_article_names = Article.five_longest_article_names
    @prolific_author = Author.most_prolific_writer
    @author_with_most_upvoted_article = Author.with_most_upvoted_article
    @article_names = Article.paginate(:page=>params[:page], :per_page=>5).all_names
    @short_articles = Article.articles_with_names_less_than_20_char
  end
end
