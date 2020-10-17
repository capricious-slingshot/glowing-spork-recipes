class CreateQuantity < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.string :ammount
    end
  end
end
