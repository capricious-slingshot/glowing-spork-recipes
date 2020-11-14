class Ingredient < ApplicationRecord
  has_many :measurements
  has_many :recipes, through: :measurements
  
  validates :name, uniqueness: true
end