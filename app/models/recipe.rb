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
    sum = ratings.collect{ |i| i.rating }.reduce(0, :+)
    sum / ratings.count
  end
  
  def measurements_attributes=(form_attributes)
    form_attributes.values.each do |row|
      # self.measurements << Measurement.first_or_create(row) if row.values.all?(&:present?) //original

      # "quantity"=>"3", "unit"=>"slices", "ingredient_id"=> "3"  // table columns

      # "quantity"=>"3", "unit"=>"slices", "ingredient_attributes"=>{"name"=>"sourdough"} //attributes_hash from form
      
      if row.values.all?(&:present?)
        binding.pry
        # ingerdient = Ingredient.find_by(name: row[:ingredient_attributes][:name]) 
        # // will return nil - ingredient_attributes inside Measurement

        # // how can I hit ingredient_attributes inside Measurement?
        # //is calling a method inside params a thing?
        # Ingredient.find_by(name: self.ingredient_attributes(row["ingredient_attributes"])) 
        
        self.measurements << Measurement.find_or_create_by(row) #blows up becasue ingredient_attributes is not a column name
      end
    end
  end
end