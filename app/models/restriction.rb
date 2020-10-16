class Restriction < ApplicationRecord 
  has_many :recipe_restrictions
  has_many :recipes, through: :recipe_restrictions
end