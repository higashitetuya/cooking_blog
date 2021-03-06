class CreateCookingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :cooking_comments do |t|
      t.references :user, foreign_key: true
      t.references :cooking, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
