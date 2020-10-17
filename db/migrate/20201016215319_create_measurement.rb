class CreateMeasurement < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.integer :recipe_id
      t.integer :quantity_id
      t.integer :unit_id
      t.integer :ingredient_id
    end
  end
end
