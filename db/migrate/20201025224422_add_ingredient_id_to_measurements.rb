class AddIngredientIdToMeasurements < ActiveRecord::Migration[5.1]
  def up
    add_reference :measurements, :ingredient, foreign_key: true
  end

  def down
    remove_reference :measurements, :ingredient, foreign_key: true
  end
end
