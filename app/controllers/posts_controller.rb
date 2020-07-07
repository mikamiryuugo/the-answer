class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to root_url
    else
      render 'new'
    end

  end


  private

  def post_params
    params.require(:post).permit(:question_title, :answer)
  end
end
