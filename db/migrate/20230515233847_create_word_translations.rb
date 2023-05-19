class CreateWordTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :word_translations do |t|
      t.references :keyword, null: false, foreign_key: true
      t.references :translate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
