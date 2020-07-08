class TopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @posts = Post.search_keyword(params[:keyword])
  end
end
