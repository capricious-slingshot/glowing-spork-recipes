class AddIngredientIdToMeasurements < ActiveRecord::Migration[5.1]
  def change
    add_reference :measurements, :ingredient, foreign_key: true
  end
end
