class Post < ApplicationRecord
  belongs_to :user

  validates :question_title, presence: true, length: { maximum: 100 }
  validates :answer, presence: true, length: { maximum: 300 }
end
