class CreateTranslationForRanches < ActiveRecord::Migration
  def up
    Ranch.create_translation_table!({ name: :string,
                                          about: :text }, {migrate_data: true})
  end

  def down
    Ranch.drop_translation_table! migrate_data: true
  end
end
