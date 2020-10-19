class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @author = User.find(@recipe.author_id)
    @steps = @recipe.steps
  end

  def edit

  end

  def update
    #itterate over measurements - 
    binding.pry
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
    params.require(:recipe).permit(:photo, :title, :description, :public, :course_id)
  end
end
