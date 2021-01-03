class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy, :save_rating]

  def index
    #this is heidious - nested routes ugh
    @user = User.find_by(id: params[:user_id])
    if @user
      if authorized_user?(@user)
        @recipes = Recipe.authored_recipes(@user.id)
        @saved_recipes = @user.saved_recipes
      elsif @user.public_profile?
        @recipes = Recipe.authored(@user.id).public_recipes
      else
        redirect_to root_path, notice: "Profile Not Public"
      end
    elsif params[:category_name].present?
      @recipes = Recipe.by_category(params[:category_name])
      @heading = params[:category_name]
      redirect_to root_path, notice: "No Recipes Matching #{params[:category_name]}" unless @recipes.present?
    else
      @recipes = Recipe.newest_first
    end

    run_user_query(params[:query], @recipes) if params[:query].present?
    run_star_filter(params[:rating].to_i, @recipes) if params[:rating].present?
  end

  def show
    @author = User.find_by(id: @recipe.author_id)
    @steps = @recipe.steps
    @categories = @recipe.categories
    @restrictions = @recipe.restrictions
    @tags = @recipe.tags
  end

  def new
    @recipe = Recipe.new
    9.times do
      m = @recipe.measurements.build
      m.build_ingredient
    end
    5.times {@recipe.steps.build}
    4.times {@recipe.tags.build}    
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_url(@recipe), notice: "Success"
    else
      flash[:alert] = "There was a problem. Recipe was not created."
      render :new
    end
  end

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Successfully Updated"
    else
      flash[:alert] = "Error. Update Not Successful"
      render :edit
    end
  end

  def destroy
    if current_user.id == @recipe.author_id
      @recipe.destroy
      @recipe.measurements.each { |m| m.destroy }
      redirect_to recipes_url, notice: "#{@recipe.title} Succesfully Deleted!"
    else
      flash[:alert] = "Error: #{@recipe.title} Not Deleted"
      render :edit
    end
  end

  def save_rating
    if params[:rating] != "Star Rating"
      record = UserRecipeCard.find_or_create_by(user_id: current_user.id, recipe_id: @recipe.id)
      record.rating = params[:rating]
      record.save

      redirect_to @recipe, notice: "Rating Saved"
    else
      redirect_to @recipe, alert: "Please Select Star Rating"
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :photo, :author_id, :description, :course_id, :public, :user_id,
      category_ids: [],
      restriction_ids: [],
      measurements_attributes: [
        :id, :quantity, :unit, :recipe_id,
          ingredient_attributes: [:id, :name]
      ],
      steps_attributes:[
        :id, :description, :position
      ],
      tags_attributes:[
        :id, :name
      ]
    )
  end

  def run_user_query(user_input, recipes)
    results = recipes.search(user_input.strip.downcase)
    if results.present? && results.length == Recipe.all.length
      redirect_to root_path, notice: "Too Many Results. Please Refine Your Search"
    elsif results.present?
      @recipes = results
    else
      redirect_to root_path, notice: "Sorry, No Matching Results"
    end
  end

  def run_star_filter(stars, recipes)
    filtered = Recipe.filter_by_star(recipes, stars)
    filtered.present? ? (@recipes=filtered) : (redirect_to root_path, notice: "Sorry, No #{stars} Star Ratings")
  end
end