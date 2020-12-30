class CreateUserRecipeCards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_recipe_cards do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :rating, default: 0
      t.boolean :saved, default: false
    end
  end
end
