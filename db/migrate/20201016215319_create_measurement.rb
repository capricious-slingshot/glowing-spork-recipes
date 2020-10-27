class CreateMeasurement < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.string :quantity
      t.string :unit
    end
  end
end
