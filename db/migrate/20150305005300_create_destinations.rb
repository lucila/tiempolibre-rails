class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :region
      t.string :country
      t.text :about
      t.integer :fall_max
      t.integer :fall_min
      t.integer :winter_max
      t.integer :winter_min
      t.integer :spring_max
      t.integer :spring_min
      t.integer :summer_max
      t.integer :summer_min

      t.timestamps null: false
    end
  end
end
