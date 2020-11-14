class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.newest_first
  end

  def show
    @author = User.find(@recipe.author_id)
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
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe_url(recipe), notice: "Success"
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

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :photo, :author_id, :description, :course_id, :public, 
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
end