class AddRecipeIdToSteps < ActiveRecord::Migration[5.1]
  def up
    add_reference :steps, :recipe, foreign_key: true
  end

  def down
    remove_reference :steps, :recipe, foreign_key: true
  end
end
