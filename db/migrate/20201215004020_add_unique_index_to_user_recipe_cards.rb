class AddUniqueIndexToUserRecipeCards < ActiveRecord::Migration[5.1]
  def change
    add_index :user_recipe_cards, [:user_id, :recipe_id], unique: true
  end
end
