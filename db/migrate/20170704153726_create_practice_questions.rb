class CreatePracticeQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :practice_questions do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.string :question_text
      t.string :option_text
      t.references :game_holder, foreign_key: true
      t.references :auto_question, foreign_key: true
      t.references :difficulty_level, foreign_key: true

      t.timestamps
    end
  end
end
