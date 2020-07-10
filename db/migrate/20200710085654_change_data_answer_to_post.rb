class ChangeDataAnswerToPost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :answer, :text
  end
end
