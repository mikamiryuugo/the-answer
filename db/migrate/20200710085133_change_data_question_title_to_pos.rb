class ChangeDataQuestionTitleToPos < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :question_title, :text
  end
end
