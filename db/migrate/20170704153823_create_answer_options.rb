class CreateAnswerOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_options do |t|
      t.string :text
      t.boolean :correct
      t.references :word_question, foreign_key: true

      t.timestamps
    end
  end
end
