require 'rails_helper'

describe "A Recipe" do
  it "correctly calculates it's star rating" do
    recipe = Recipe.first
    
    expect(recipe.star_rating).to eq(3)
  end
end