class Post < ApplicationRecord
  belongs_to :user

  validates :question_title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :answer, presence: true, length: { minimum: 20, maximum: 300 }


# メソッド名にself.入れるとクラスメソッド。Post.search_keywordの意味になる。(modelクラスのレコードを検索するなどの用途などに使う。まさに今回の検索用やな) *なおメソッド内のselfはインスタンス自信を指すで
  def self.search_keyword(keyword)
    return unless keyword
    question_titles = Post.where(['question_title LIKE ?', "%#{keyword}%"])
    answers = Post.where(['answer LIKE ?', "%#{keyword}%"])
    question_titles + answers
  end
end
