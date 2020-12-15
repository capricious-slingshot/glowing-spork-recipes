class AddUniqueIndexToUserRecipes < ActiveRecord::Migration[5.1]
  def change
    add_index :user_recipes, [:user_id, :recipe_id], unique: true
  end
end
