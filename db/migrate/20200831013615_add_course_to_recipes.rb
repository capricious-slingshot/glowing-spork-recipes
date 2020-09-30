class AddCourseToRecipes < ActiveRecord::Migration[5.1]
  def up
    add_column :recipes, :course_id, :integer
    add_index :recipes, :course_id
  end

  def down
    remove_column :recipes, :course_id, :integer
    remove_index :recipes, :course_id
  end
end
