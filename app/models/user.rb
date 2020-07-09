class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :post_likes, dependent: :destroy


  def post_like?(post)
    self.post_likes.pluck(:post_id).include?(post.id)
  end

  def post_like(post)
    self.post_likes.create(post_id: post.id)
  end

  def cancel_post_like(post)
    self.post_likes.find_by(post_id: post.id).destroy
  end
end
