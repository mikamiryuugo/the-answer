class PostsController < ApplicationController
  before_action :current_user_post, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "編集しました"
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:question_title, :answer)
  end

  def current_user_post
    @post = current_user.posts.find(params[:id])
  end

end
