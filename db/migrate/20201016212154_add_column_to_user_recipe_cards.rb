class AddColumnToUserRecipeCards < ActiveRecord::Migration[5.1]
  def up
    add_column :user_recipe_cards, :notes, :text
  end

  def down
    remove_column :user_recipe_cards, :notes, :text
  end
end
