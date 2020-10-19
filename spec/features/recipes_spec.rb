require 'rails_helper'

describe 'Recipes' do
  describe "View Index" do
    it 'shows index card of all recipes' do
      visit root_path    
      recipe = Recipe.all.sample
      user = User.find(recipe.author_id)
  
      expect(page).to have_text(recipe.title)
      expect(page).to have_link(nil, href: "#{recipe_path(recipe)}")
      expect(page).to have_link("#{user.name}", href: "/users/#{user.id}")
      expect(page).to have_text("#{recipe.description.truncate(40)}")
      expect(page).to have_text("#{recipe.created_at.strftime('%B %d, %Y')}")
    end
  end

  describe "View Show" do
    before do
      @recipe = Recipe.all.sample
      visit "/recipes/#{@recipe.id}"
      expect(current_path).to eq(recipe_path(@recipe))
    end

    it 'diaplays details of a individual recipe' do
      user = User.find(@recipe.author_id)

      expect(page).to have_text("#{@recipe.title.capitalize}")
      expect(page).to have_text("Author: #{user.name}")
      expect(page).to have_link("#{user.name}", href: "/users/#{user.id}")
      expect(page).to have_text("#{@recipe.description}")
      expect(page).to have_text("#{@recipe.created_at.strftime('%B %d, %Y')}")
    end

    it 'displays correct star rating' do
      expect(page).to have_tag('span.has-text-star', count: 3)
      expect(page).to have_tag('i.fa-star', count: 3)
      expect(page).to have_text("#{@recipe.star_rating} stars")
    end

    it 'displays every ingredient and corrosponding measurement' do
      expect(page).to have_text("Ingredients")
      # needs to be built out
    end

    it 'displays correct number of steps' do
      expect(page).to have_text("Step")
      # need test for step count
    end

    it 'displays correct course' do
      # need test for course
    end

    it 'displays correct categories that it belongs to ' do
      # need test for categories
    end

    it 'displays correct dietary restrictions ' do
      # need test for dietary restrictions
    end
    
    it 'displays correct hashtags ' do
      # need test for tags
    end

    describe 'signed in user' do
      it 'can rate a recipe from /recipes/id page'
      it 'can save a recipe from /recipes/id page'
    end

  end
  
end
