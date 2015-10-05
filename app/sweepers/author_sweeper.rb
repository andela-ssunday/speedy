class AuthorSweeper < ActionController::Caching::Sweeper
  observe Author

  def after_save(data)
    expire_cache_for(data)
  end

  def before_create(data)
    expire_cache_for(data)
  end


  def expire_cache_for(data)
    cache_key = "views/#{ENV['REQUEST']}/*"
    Rails.cache.delete_matched(cache_key)
  end
end
