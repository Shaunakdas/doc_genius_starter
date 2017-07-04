class CreateDifficultyLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :difficulty_levels do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.integer :value

      t.timestamps
    end
  end
end
