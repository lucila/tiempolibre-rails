class CreateCruises < ActiveRecord::Migration
  def change
    create_table :cruises do |t|
      t.string :name
      t.text :about
      t.references :region, index: true

      t.timestamps null: false
    end
    add_foreign_key :cruises, :regions
  end
end
