class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:question_title, :answer)
  end
end
