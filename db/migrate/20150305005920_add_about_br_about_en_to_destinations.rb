class AddAboutBrAboutEnToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :about_br, :text
    add_column :destinations, :about_en, :text
  end
end
