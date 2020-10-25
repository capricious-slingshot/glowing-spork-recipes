class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :users, through: :user_recipes

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  has_many :recipe_restrictions
  has_many :restrictions, through: :recipe_restrictions

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  has_many :measurements
  has_many :ingredients, through: :measurements

  has_many :steps

  belongs_to :course
  validates :title, presence: true
  validates :description, presence: true
  validates :course_id, presence: true

  def star_rating
    ratings = UserRecipe.where(recipe_id: self.id)
    return 0 if ratings.empty?
    sum = ratings.collect{ |i| i.rating}.reduce(0, :+)
    sum / ratings.count
  end
  
end
