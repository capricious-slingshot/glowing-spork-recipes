class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :users, through: :user_recipes

  has_many :recipes_catagories
  has_many :catagories, through: :recipes_catagories

  has_many :recipes_restrictions
  has_many :restrictions, through: :recipes_restrictions

  has_many :recipes_tags
  has_many :tags, through: :recipes_tags

  belongs_to :course
end
