class CreateTranslationForExcursions < ActiveRecord::Migration
  def up
    Excursion.create_translation_table!({ name: :string,
                                          description: :text }, {migrate_data: true})
  end

  def down
    Excursion.drop_translation_table! migrate_data: true
  end
end
