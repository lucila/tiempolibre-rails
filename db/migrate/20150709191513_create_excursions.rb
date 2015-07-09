class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.string :name
      t.text :description
      t.references :destination, index: true

      t.timestamps null: false
    end
    add_foreign_key :excursions, :destinations
  end
end
