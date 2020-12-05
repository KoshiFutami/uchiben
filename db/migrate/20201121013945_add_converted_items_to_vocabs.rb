class AddConvertedItemsToVocabs < ActiveRecord::Migration[6.0]
  def change
    add_column :vocabs, :converted_translation, :string
    add_column :vocabs, :converted_sentence, :text
  end
end
