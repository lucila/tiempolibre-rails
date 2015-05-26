class RemoveBrEnFromDestinations < ActiveRecord::Migration
  def change
    remove_column :destinations, :about_br
    remove_column :destinations, :about_en
  end
end
