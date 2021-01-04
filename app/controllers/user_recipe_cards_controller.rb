class UserRecipeCardsController < ApplicationController
  before_action :require_signin
  before_action :convert_url_params, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_card, only: [:edit, :update, :destroy]
  before_action :find_recipe, only: [:save_recipe]

  def new
    @card = UserRecipeCard.find_or_initialize_by(user_id: @user_id, recipe_id: @recipe_id)
    @author = recipe_author?(@card)
  end

  def create
    user = User.find_by(id: @user_id)
    card = UserRecipeCard.find_or_create_by(user_id: @user_id, recipe_id: @recipe_id)
    card.rating = params[:user_recipe_card][:rating].to_i
    card.notes = params[:user_recipe_card][:notes]
    card.saved = params[:user_recipe_card][:saved] unless recipe_author?(card)

    if card.save
      redirect_to "/recipes/#{@recipe_id}", notice: "Notes Successfully Saved"
    else 
      flash.now[:alert] =  "There was a problem saving your notes"
      render :new
    end
  end

  def edit
    @author = recipe_author?(@card)
  end

  def update
    if @card.update(recipe_card_params)
      redirect_to "/recipes/#{@recipe_id}", notice: "Successfully Updated Notes"
    else
      flash.now[:alert] = "Error. Update Not Successful"
      render :edit
    end
  end

  def destroy
    if current_user.id == @card.user_id
      @card.destroy
      redirect_to "/recipes/#{@recipe_id}", notice: "Notes Succesfully Deleted!"
    else
      flash.now[:alert] = "OOps! There was an error"
      render :edit
    end
  end

  def save_recipe
      record = UserRecipeCard.find_or_create_by(user_id: current_user.id, recipe_id: @recipe.id)
      record.saved = true
      record.save

      redirect_to @recipe, notice: "Recipe Saved"
  end

  private

  def convert_url_params
    @user_id = params[:user_id].to_i
    @recipe_id = params[:recipe_id].to_i
  end
  
  def find_card
    @card = UserRecipeCard.find_by(user_id: @user_id, recipe_id: @recipe_id)
  end
  
  def recipe_card_params
    params.require(:user_recipe_card).permit(:user_id, :recipe_id, :rating, :saved, :notes)
  end
  
  def recipe_author?(card)
    current_user.id == card.recipe.author_id
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end