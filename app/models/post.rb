class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, dependent: :destroy
  validates :question_title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :answer, presence: true, length: { minimum: 20, maximum: 300 }


# メソッド名にself.入れるとクラスメソッド。Post.search_keywordの意味になる。(modelクラスのレコードを検索するなどの用途などに使う。まさに今回の検索用やな) *なおメソッド内のselfはインスタンス自信を指すで
  def self.search_keyword(keyword)
    return unless keyword
    split_keyword = keyword.split(/[[:blank:]]/)
    split_keyword.delete("")
    posts = []
    split_keyword.each do |keyword|
      question_titles = Post.where(['question_title LIKE ?', "%#{keyword}%"])
      posts.push(question_titles)
      answer = Post.where(['answer LIKE ?', "%#{keyword}%"])
      posts.push(answer)
    end
    posts.flatten
  end
end
