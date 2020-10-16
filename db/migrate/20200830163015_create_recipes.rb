class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :photo
      t.string :title
      t.integer :author_id
      t.string :description
      t.boolean :public, default: true

      t.timestamps
    end
  end
end