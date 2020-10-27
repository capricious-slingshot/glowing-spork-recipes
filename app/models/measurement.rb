class Measurement < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, presence: true
  validates :unit, presence: true
  # validates :recipe_id, presence: true
  validates :ingredient_id, presence: true

  def ingredient_attributes=(attr)
    self.ingredient = Ingredient.find_or_create_by(attr) if attr['name'].present?
  end
end