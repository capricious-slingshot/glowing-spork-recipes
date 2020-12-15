class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  #need to validate that user_id and recipe_id match is unique
  validates :user_id, uniqueness: { scope: :recipe_id}
end