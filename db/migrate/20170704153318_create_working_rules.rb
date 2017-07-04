class CreateWorkingRules < ActiveRecord::Migration[5.0]
  def change
    create_table :working_rules do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.string :question_text
      t.references :game_holder, foreign_key: true
      t.references :difficulty_level, foreign_key: true

      t.timestamps
    end
  end
end
