class CreateTranslates < ActiveRecord::Migration[7.0]
  def change
    create_table :translates do |t|
      t.string :translated
      t.string :word_class, array: true, default: []
      t.string :description
      t.integer :category

      t.timestamps
    end
  end
end
