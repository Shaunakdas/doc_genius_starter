class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :code
      t.string :display_text
      t.string :region_type
      t.references :parent_region

      t.timestamps
    end
  end
end
