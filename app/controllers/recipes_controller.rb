class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @author = User.find(@recipe.author_id)
    @steps = @recipe.steps
  end

  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    recipe = Recipe.new(recipe_params)
    recipe.author_id = current_user.id
    if recipe.save
      redirect_to recipe_url(recipe), notice: "Success"
    else
      flash[:alert] = "There was a problem. Recipe not created."
      render :edit
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
      redirect_to recipes_path, notice: "#{@recipe.title} Succesfully Deleted!"
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
    params.require(:recipe).permit(:title, :photo, :description, :course_id, :public)
  end
end
