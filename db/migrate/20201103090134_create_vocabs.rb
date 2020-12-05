class CreateVocabs < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabs do |t|
      t.string :name, null: false
      t.string :translation, null: false
      t.text :sentence, null: false
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
