class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, length: {minimum: 100}
  validates :course_id, presence: true
  validates :photo, allow_blank: true, format:{
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "GIF, JPG, or PNG only"
  }

  belongs_to :course

  has_many :user_recipes
  has_many :users, through: :user_recipes

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  has_many :recipe_restrictions
  has_many :restrictions, through: :recipe_restrictions

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  has_many :measurements, dependent: :destroy
  has_many :ingredients, through: :measurements

  has_many :steps

  accepts_nested_attributes_for :steps 

  def star_average
    ratings = UserRecipe.where(recipe_id: self.id)
    return 0 if ratings.empty?
    sum = ratings.collect{ |i| i.rating }.reduce(0, :+)
    sum / ratings.count
  end
  
  def measurements_attributes=(form_attributes)
    form_attributes.values.each do |row|
      if row.values.all?(&:present?)
        ingredient = Ingredient.find_or_create_by(name: row[:ingredient_attributes][:name])
        self.measurements << Measurement.where(quantity: row['quantity'], unit: row['unit'], ingredient_id: ingredient.id).first_or_create(row)
      end
    end
  end

  def tags_attributes=(form_attr)
    form_attr.values.each do |tag|
      if tag.values.all?(&:present?)
        tag_name = Tag.format(tag['name'])
        t = Tag.find_or_create_by(name: tag_name)
        self.tags << t if !self.tags.include?(t)
      end
    end
  end

  def author?(current_user)
    author = User.find_by(id: self.author_id)
    current_user == author
  end

  # def self.by_category(name)
  #   where('name = ?' name).order("created_at desc")
  # end

  def self.newest_first
    all.order("created_at desc")
  end

  def self.top_rated
    all.order("star_average asc")
  end

  def self.user_recipes(user_id)
    where(author_id: user_id)
  end

  def self.search(term)
    left_joins(:course).where("LOWER(title) LIKE :term OR description LIKE :term OR LOWER(name) LIKE :term", term: "%#{term}%")
    #ingredients, restrictions, tags - join tables? how to handle?
  end

  def self.filter_by_star(collection, stars)
    collection.select{ |i| i.star_average == stars}
  end

end