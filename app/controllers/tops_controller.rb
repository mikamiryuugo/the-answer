class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @posts = Post.search_keyword(params[:keyword])
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(20) unless @posts.nil?
  end
end
