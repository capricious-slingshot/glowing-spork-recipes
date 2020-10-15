class CreateUsersRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :users_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :rating, default: 0
      t.boolean :saved, default: false
    end
  end
end
