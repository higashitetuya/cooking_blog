class AddDetailsToCookingComments < ActiveRecord::Migration[5.2]
  def change
    add_column :cooking_comments, :rate, :float
  end
end
