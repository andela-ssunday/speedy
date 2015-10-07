
# include ActionController::Caching::Actions
# include ActionController::Caching
class Author < ActiveRecord::Base
  has_many :articles
  # before_save :sweepam

  def sweepam
    cache_key = "views/localhost:3005/author?page=296"
    Rails.cache.delete(cache_key)
  end

  def self.generate_authors(count=1000)
    count.times do
      Fabricate(:author)
    end
    first.articles << Article.create(name: "some commenter", body: "some body")
  end

  def self.most_prolific_writer
    self.find_by_sql("select count(art.id) as size , auth.name from articles as art, authors as auth where art.author_id = auth.id group by auth.name order by size desc limit 1").first
  end

  def self.with_most_upvoted_article
    self.find_by_sql("select auth.name, art.upvotes as size from articles as art, authors as auth where art.author_id = auth.id order by size desc limit 1").first.name
  end


end
