class AddConvertedNameToVocabs < ActiveRecord::Migration[6.0]
  def change
    add_column :vocabs, :converted_name, :string
  end
end
