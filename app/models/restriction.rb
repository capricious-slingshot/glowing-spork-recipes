class Restriction < ApplicationRecord 
  has_many :recipe_restrictions, dependent: :destroy
  has_many :recipes, through: :recipe_restrictions
end