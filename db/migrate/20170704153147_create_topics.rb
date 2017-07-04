class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
