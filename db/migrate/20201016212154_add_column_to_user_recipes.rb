class AddColumnToUserRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :user_recipes, :notes, :text
  end
end
