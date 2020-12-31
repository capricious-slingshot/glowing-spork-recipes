class UserRecipeCard < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id, uniqueness: { scope: :recipe_id}

  def self.record(user_id, recipe_id)
    self.find_by(user_id: user_id, recipe_id: recipe_id)
  end

  def self.recipe_saves(id)
    all.where(recipe_id: id, saved: true)
  end

end