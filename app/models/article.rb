class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments

  def self.all_names
    select(:name)
  end

  def self.five_longest_article_names
    self.find_by_sql("select name, length(name) as name_size from articles order by name_size desc limit 5")
  end

  def self.articles_with_names_less_than_20_char
    self.find_by_sql("select name, length(name) as name_size from articles where name_size < 20")
  end

end
