class CreateUserAcadProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_acad_profiles do |t|
      t.references :acad_entity, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
