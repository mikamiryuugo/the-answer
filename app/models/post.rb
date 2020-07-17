class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, dependent: :destroy
  validates :question_title, presence: true, length: { minimum: 10, maximum: 200 }
  validates :answer, presence: true, length: { minimum: 20, maximum: 10000 }


# メソッド名にself.入れるとクラスメソッド。Post.search_keywordの意味になる。(modelクラスのレコードを検索するなどの用途などに使う。まさに今回の検索用やな) *なおメソッド内のselfはインスタンス自信を指すで
  def self.search_keyword(keyword)
    return unless keyword
    split_keyword = keyword.split(/[[:blank:]]/)
    split_keyword.delete("")
    posts = []
    split_keyword.each do |keyword|
      question_titles = Post.where(['question_title LIKE BINARY ?', "%#{keyword}%"])
      answer = Post.where(['answer LIKE BINARY ?', "%#{keyword}%"])

      if answer&.first&.id == question_titles&.first&.id
        posts.push(answer)
      else
        posts.push(answer)
        posts.push(question_titles)
      end
    end
    posts.flatten!
    # LRGMが多い順
    posts.sort_by!{|post| post.post_likes.count}.reverse
  end
end
