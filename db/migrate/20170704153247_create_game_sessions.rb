class CreateGameSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :game_sessions do |t|
      t.date :attempt_date
      t.references :game_holder, foreign_key: true

      t.timestamps
    end
  end
end
