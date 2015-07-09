class CreateRanches < ActiveRecord::Migration
  def change
    create_table :ranches do |t|
      t.string :name
      t.text :about
      t.references :destination, index: true

      t.timestamps null: false
    end
    add_foreign_key :ranches, :destinations
  end
end
