class CreateAttemptScores < ActiveRecord::Migration[5.0]
  def change
    create_table :attempt_scores do |t|
      t.decimal :value
      t.decimal :time_taken
      t.integer :correct_count
      t.integer :incorrect_count
      t.boolean :seen
      t.boolean :passed
      t.boolean :failed
      t.references :game_attempt, foreign_key: true
      t.references :game_holder, foreign_key: true

      t.timestamps
    end
  end
end
