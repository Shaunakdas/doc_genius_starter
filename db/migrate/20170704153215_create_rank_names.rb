class CreateRankNames < ActiveRecord::Migration[5.0]
  def change
    create_table :rank_names do |t|
      t.string :code
      t.integer :sequence
      t.string :display_text
      t.string :explainer

      t.timestamps
    end
  end
end
