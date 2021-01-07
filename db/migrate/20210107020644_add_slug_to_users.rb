class AddSlugToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :slug, :string
  end

  def down
    remove_column :users, :slug, :string
  end
end
