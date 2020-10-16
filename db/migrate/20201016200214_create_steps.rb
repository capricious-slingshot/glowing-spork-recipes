class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :description
      t.integer :position
      t.integer :recipe_id
    end
  end
end
