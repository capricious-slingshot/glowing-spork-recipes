class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :photo, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :public_profile, :boolean, default: true
    add_column :users, :metric, :boolean, default: false
  end

  def down
    remove_column :users, :photo, :string
    remove_column :users, :bio, :string
    remove_column :users, :location, :string
    remove_column :users, :public_profile, :boolean, default: true
    remove_column :users, :metric, :boolean
  end
end
