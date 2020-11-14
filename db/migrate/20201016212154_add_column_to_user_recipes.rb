class AddColumnToUserRecipes < ActiveRecord::Migration[5.1]
  def up
    add_column :user_recipes, :notes, :text
  end

  def down
    remove_column :user_recipes, :notes, :text
  end
end
