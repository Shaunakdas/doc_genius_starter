class CreateStandards < ActiveRecord::Migration[5.0]
  def change
    create_table :standards do |t|
      t.string :name
      t.string :code
      t.integer :sequence

      t.timestamps
    end
  end
end
