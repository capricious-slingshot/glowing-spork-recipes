class Measurement < ApplicationRecord
  belongs_to :recipe

  has_many :ingredients
  has_many :quantities
  has_many :units

  def ammount
    Quantity.find(quantity_id).ammount
  end

  def unit
    Unit.find(unit_id).name
  end

  def ingredient
    Ingredient.find(unit_id).name
  end
end