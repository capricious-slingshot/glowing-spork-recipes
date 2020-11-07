class Tag < ApplicationRecord
  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags
  validates :name, presence: true, uniqueness: true

  def self.format(str)
    str.scan(/[a-zA-Z]/).join('').downcase
  end
end