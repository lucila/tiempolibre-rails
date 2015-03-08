class RemoveRegionAndCountryFromDestination < ActiveRecord::Migration
  def change
    remove_column :destinations, :region
    remove_column :destinations, :country
    add_reference :regions, :country, index: true
    add_reference :destinations, :region, index: true
  end
end
