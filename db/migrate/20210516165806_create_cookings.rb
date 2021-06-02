class CreateCookings < ActiveRecord::Migration[5.2]
  def change
    create_table :cookings do |t|

      t.string :cooking_image_id
      t.text   :name
      t.text   :cooking_introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
