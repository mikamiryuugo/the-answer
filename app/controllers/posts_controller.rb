class PostsController < ApplicationController

  def index
    posts = current_user.posts
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
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
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "編集しました"
      redirect_to @post
    else
      render 'edit'
    end
  end


  def destroy
    current_user.posts.find(params[:id]).destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:question_title, :answer)
  end
end
