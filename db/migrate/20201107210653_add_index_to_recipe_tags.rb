class AddIndexToRecipeTags < ActiveRecord::Migration[5.1]
  def up
    add_index :recipe_tags, [:recipe_id, :tag_id], unique: true
  end

  def down
    remove_index :recipe_tags, [:recipe_id, :tag_id], unique: true
  end
end
