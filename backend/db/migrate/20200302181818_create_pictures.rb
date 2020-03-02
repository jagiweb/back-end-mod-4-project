class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.references :users, null: false, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
