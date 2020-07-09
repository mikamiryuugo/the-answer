class PostLikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    unless current_user.post_like?(@post)
      current_user.post_like(@post)
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end

  def destroy
    @post = PostLike.find(params[:id]).post
    if current_user.post_like?(@post)
      current_user.cancel_post_like(@post)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

end
