class CreateSubTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_topics do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
