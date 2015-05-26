class CreateTranslationForRegions < ActiveRecord::Migration
  def up
    Region.create_translation_table!({ name: :string }, {migrate_data: true})
  end

  def down
    Region.drop_translation_table! migrate_data: true
  end
end
