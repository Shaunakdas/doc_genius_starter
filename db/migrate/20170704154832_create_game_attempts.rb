class CreateGameAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :game_attempts do |t|
      t.references :game, polymorphic: true
      t.references :game_session, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
