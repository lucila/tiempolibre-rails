class CreateTranslationForCruises < ActiveRecord::Migration
  def up
    Cruise.create_translation_table!({ name: :string,
                                          about: :text }, {migrate_data: true})
  end

  def down
    Cruise.drop_translation_table! migrate_data: true
  end
end
