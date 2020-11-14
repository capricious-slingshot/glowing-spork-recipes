class AddRecipeIdToMeasurements < ActiveRecord::Migration[5.1]
  def up
    add_reference :measurements, :recipe, foreign_key: true
  end

  def down
    remove_reference :measurements, :recipe, foreign_key: true
  end
end
