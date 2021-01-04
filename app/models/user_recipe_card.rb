class UserRecipeCard < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  
  validates :user_id, uniqueness: { scope: :recipe_id}
  
  scope :recipe_saves, -> (id) { all.where(recipe_id: id, saved: true) }

  def self.record(user_id, recipe_id)
    self.find_by(user_id: user_id, recipe_id: recipe_id)
  end

end