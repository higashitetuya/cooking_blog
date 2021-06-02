class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :cooking, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :cooking_id], unique: :true
  end
end
