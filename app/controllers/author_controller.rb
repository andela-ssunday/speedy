class AuthorController < ApplicationController
  caches_action :index, :cache_path => Proc.new { |c| c.request.original_url }
  cache_sweeper :author_sweeper

  def index
    params[:page] = params[:page].nil? ? 1 : params[:page]
    @authors = Author.includes(:articles).paginate(:page => params[:page], :per_page => 10).select(:id,:name)
  end



end
