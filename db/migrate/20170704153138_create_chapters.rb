class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :code
      t.integer :seq_stream
      t.integer :seq_standard
      t.references :subject, foreign_key: true
      t.references :stream, foreign_key: true

      t.timestamps
    end
  end
end
