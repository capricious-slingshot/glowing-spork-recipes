class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  #need to validate that user_id and recipe_id match is unique
  validates :user_id, uniqueness: { scope: :recipe_id}

  def self.record(user_id, recipe_id)
    self.find_by(user_id: user_id, recipe_id: recipe_id)
  end
end