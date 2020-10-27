class AddRecipeIdToMeasurements < ActiveRecord::Migration[5.1]
  def change
    add_reference :measurements, :recipe, foreign_key: true
  end
end
