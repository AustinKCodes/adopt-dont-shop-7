class CreateApplicationPets < ActiveRecord::Migration[7.1]
  def change
    create_table :application_pets do |t|
      t.references :application, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
