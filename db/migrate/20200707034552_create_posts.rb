class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :question_title
      t.string :answer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
