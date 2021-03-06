class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :description, length: {minimum: 100}
  validates :course_id, presence: true
  validates :photo, allow_blank: true, format:{
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "GIF, JPG, or PNG only"
  }

  belongs_to :course

  has_many :user_recipe_cards
  has_many :users, through: :user_recipe_cards

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  has_many :recipe_restrictions
  has_many :restrictions, through: :recipe_restrictions

  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  has_many :measurements, dependent: :destroy
  has_many :ingredients, through: :measurements

  has_many :steps
  attr_accessor :_destroy

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  #Deep Search: ingredients, restrictions, tags - join tables? how to handle? 
  scope :search, -> (term) { left_joins(:course).where("LOWER(title) LIKE :term OR description LIKE :term OR LOWER(name) LIKE :term", term: "%#{term}%") }
  scope :newest_first, -> (collection) { collection.order("created_at desc") }
  scope :oldest_first, -> (collection) { collection.order("created_at") }
  scope :a_z, -> (collection) { collection.order(:title) }
  scope :z_a, -> (collection) { collection.order(title: :desc) }
  scope :top_rated, -> { all.order("star_average asc") }
  scope :authored, ->  (user_id) { where(author_id: user_id) }
  scope :filter_by_star, ->  (collection, stars) { collection.select{ |i| i.star_average == stars} }
  scope :public_recipes, -> { where(public: true) }
  scope :by_category, -> (name) { Category.find_by(name: name).recipes.public_recipes }

  def star_average
    ratings = UserRecipeCard.where(recipe_id: self.id)
    return 0 if ratings.empty?
    sum = ratings.collect{ |i| i.rating }.compact.reduce(0, :+)
    (sum / ratings.count).floor
  end
  
  def measurements_attributes=(form_attributes)
    form_attributes.values.each do |row|
      if row.values.all?(&:present?)
        
        if row["_destroy"] != "false"
          Measurement.find_by(id: row['id']).destroy
        else
          ingredient = Ingredient.find_or_create_by(name: row[:ingredient_attributes][:name])
          self.measurements << Measurement.where(quantity: row['quantity'], unit: row['unit'], ingredient_id: ingredient.id).first_or_create(row.except("_destroy"))
        end
      end
    end
  end

  def tags_attributes=(form_attr)
    form_attr.values.each do |tag|
      if tag.values.all?(&:present?)
        if tag["_destroy"] != "false"
          RecipeTag.find_by(recipe_id: self.id, tag_id: tag['id']).destroy
        else
          tag_name = Tag.format(tag['name'])
          t = Tag.find_or_create_by(name: tag_name)
          self.tags << t if !self.tags.include?(t)
        end
      end
    end
  end

  def author?(user)
    author = User.find_by(id: self.author_id)
    user == author
  end

  def saved?(user)
    record = UserRecipeCard.record(user.id, self.id)
    record.present? ? record.saved : false
  end

  def ratings
    UserRecipeCard.all.where(recipe_id: self.id)
  end

  def number_of_saves
    UserRecipeCard.recipe_saves(self.id).count
  end

  def self.filter_by_order(ordering, collection)
    case ordering
    when "Most Recent"
      self.newest_first(collection)
    when "A-Z"
      self.a_z(collection)
    when "Z-A"
      self.z_a(collection)
    when "Oldest"
      self.oldest_first(collection)
    end
  end

end