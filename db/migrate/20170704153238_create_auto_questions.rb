class CreateAutoQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :auto_questions do |t|
      t.string :question_tag
      t.string :answer_tag
      t.references :question_type, foreign_key: true

      t.timestamps
    end
  end
end
