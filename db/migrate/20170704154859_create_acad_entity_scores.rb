class CreateAcadEntityScores < ActiveRecord::Migration[5.0]
  def change
    create_table :acad_entity_scores do |t|
      t.decimal :average_value
      t.decimal :max_value
      t.decimal :last_value
      t.decimal :time_spent
      t.integer :passed_count
      t.integer :failed_count
      t.integer :seen_count
      t.decimal :percentile
      t.references :acad_entity, polymorphic: true
      t.references :attempt_score, foreign_key: true

      t.timestamps
    end
  end
end
