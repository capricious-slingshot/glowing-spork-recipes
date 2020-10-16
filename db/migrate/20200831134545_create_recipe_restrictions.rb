class CreateRecipeRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_restrictions, id: false do |t|
      t.integer :recipe_id
      t.integer :restriction_id
    end
  end
end
