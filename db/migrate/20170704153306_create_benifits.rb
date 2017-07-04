class CreateBenifits < ActiveRecord::Migration[5.0]
  def change
    create_table :benifits do |t|
      t.string :code
      t.string :title
      t.string :explainer
      t.integer :sequence
      t.string :image_url

      t.timestamps
    end
  end
end
