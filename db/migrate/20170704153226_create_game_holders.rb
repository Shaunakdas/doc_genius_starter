class CreateGameHolders < ActiveRecord::Migration[5.0]
  def change
    create_table :game_holders do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.string :game_type
      t.string :image_url
      t.integer :latest_sequence
      t.integer :game_count
      t.references :question_type, foreign_key: true
      t.references :rank_name, foreign_key: true

      t.timestamps
    end
  end
end
