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
    9.times do
      #someting is wrong with attributes association
      #can't call the 'build_ingredients' method that is based on association
      #binding.pry
      #can't hit binding inside ingredient_attributes
      
      #  m = @recipe.measurements.build
      # m.build_ingredient

      @recipe.measurements.build
      Ingredent.new #short cuts to the association error
    end
  end

  def create
    recipe = Recipe.create(recipe_params)
    if recipe.valid?
      redirect_to recipe_url(recipe), notice: "Success"
    else
      flash[:alert] = "There was a problem. Recipe was not created."
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
      measurements_attributes: [
        :quantity, :unit, :ingredient_name, ingredient_attributes: [:name]
      ]
    )
  end
end
