class UserRecipeCardsController < ApplicationController

  def new
    @user_id = params[:user_id].to_i
    @recipe_id = params[:recipe_id].to_i
    @card = UserRecipeCard.find_or_initialize_by(user_id: @user_id, recipe_id: @recipe_id)
  end

  def create
    user = User.find_by(id: params[:user_id])
    card = UserRecipeCard.find_or_create_by(user_id: user.id, recipe_id: params[:recipe_id])
    card.rating = params[:user_recipe_card][:rating].to_i
    card.notes = params[:user_recipe_card][:notes]
    card.saved = true unless recipe_author?(card)

    if card.save
      redirect_to user_recipes_url(user), notice: "Notes Successfully Saved"
    else 
      render :new, alert: "There was a problem saving your notes"
    end
  end

  def edit
    #@card = UserRecipeCard.find_by(user_id: @user, recipe_id: @recipe)
  end

  def update
    #user_recipe_card_path(@user_id, @recipe_id)
  end

  def destroy

  end

  private

  def recipe_author?(card)
    card.user.id == card.recipe.author_id
  end
end