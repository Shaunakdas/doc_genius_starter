class CreateWordQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :word_questions do |t|
      t.string :text
      t.string :hint
      t.string :explaination
      t.integer :sequence
      t.integer :correct_count
      t.references :game_holder, foreign_key: true
      t.references :difficulty_level, foreign_key: true

      t.timestamps
    end
  end
end
