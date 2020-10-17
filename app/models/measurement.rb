class Measurement < ApplicationRecord
  belongs_to :recipe

  has_many :ingredients
  has_many :quantities
  has_many :units

  def quantity
    Quantity.find(quantity_id).ammount
  end

  def unit
    Unit.find(unit_id).name.pluralize
  end

  def ingredient
    Ingredient.find(unit_id).name
  end
end