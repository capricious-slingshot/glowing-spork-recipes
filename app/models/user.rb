class User < ApplicationRecord

  extend ActiveModel::Naming
  before_validation :generate_slug

  validates :name, presence: true, uniqueness: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :email, presence: true, email: true
  validates :password, length: { minimum: 9 }, on: [:create, :update], unless: lambda{ |user| user.password.blank? }
  validates :password_confirmation, presence: true, on: [:create, :update], unless: lambda{ |user| user.password.blank? }
  validates :slug, uniqueness: true
  has_secure_password

  has_many :user_recipe_cards, dependent: :destroy
  has_many :recipes, through: :user_recipe_cards

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      binding.pry
      stubb_password = SecureRandom.hex
      user.name = auth_hash["info"]["nickname"] unless user.name.present?
      user.email = auth_hash["info"]["email"] unless user.email.present?
      user.password =  stubb_password
      user.password_confirmation =  stubb_password
      user.photo = auth_hash["extra"]["raw_info"]["avatar_url"] unless user.photo.present?
      user.bio = auth_hash["extra"]["raw_info"]["bio"] unless user.bio.present?
      user.location = auth_hash["extra"]["raw_info"]["location"] unless user.location.present?
    end
  end

  def saved_recipes
    self.recipe_cards.collect { |card| Recipe.find_by(id: card.recipe_id)}
  end

  def recipe_cards
    self.user_recipe_cards.all.where(user_id: self.id, saved: true)
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize if name
  end

end