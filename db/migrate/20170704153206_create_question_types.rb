class CreateQuestionTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_types do |t|
      t.string :name
      t.string :code
      t.integer :sequence
      t.string :image_url
      t.references :sub_topic, foreign_key: true

      t.timestamps
    end
  end
end
