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

      expect(page).to have_text("#{@recipe.title}")
      expect(page).to have_text("#{user.name}")
      expect(page).to have_link("#{user.name}", href: "/users/#{user.id}")
      expect(page).to have_text("#{@recipe.description}")
      expect(page).to have_text("#{@recipe.created_at.strftime('%B %d, %Y')}")
    end

    it 'displays correct star rating' do
      expect(page).to have_text("stars")
      # need test for star rating
    end

    it 'displays every ingredient and corrosponding measurement' do
      expect(page).to have_text("Ingredients")
      # needs to be built out
    end

    xit 'displays correct number of steps' do
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

  describe 'editing a recipe' do
    before do
      @recipe = Recipe.create(photo: 'pizza.jpg', title: 'Margaharita Pizza', author_id: 2, description: "MCurabitur volutpat massa eu molestie tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consectetur eros ut lacus dapibus tincidunt. Sed semper hendrerit felis vitae pulvinar. Duis hendrerit ex sed eros sagittis feugiat. Aliquam erat volutpat. Ut euismod in sem in sollicitudin. Vestibulum ipsum ex, pretium at sem ac, interdum hendrerit felis. Sed ac diam ullamcorper, gravida nulla eu, dapibus nisi. Mauris ac feugiat nisl. Curabitur non eros eu tellus maximus vehicula non nec turpis. In hac habitasse platea dictumst. Duis sit amet quam et nulla congue feugiat.", course_id: 4, public: true)
    end

    it 'does not show the edit button to a user that is not the author' do
      current_user = User.create(name: 'test5', email: 'test5@me.com', password: '123456789', password_confirmation: '123456789')
      visit recipe_url(@recipe)
      expect(page).to_not have_button("Edit Recipe")
    end

    it 'shows edit botton that takes the user to the populated edit form' do
      visit recipe_url(@recipe)
      click_link 'Edit Recipe'

      expect(current_path).to eq(edit_recipe_path(@recipe))

      expect(find_field('Title').value).to eq(@recipe.title)
      expect(find_field('Photo').value).to eq(@recipe.photo)
      expect(find_field('Description').value).to eq(@recipe.description)
      expect(find_field('Course').value).to eq(@recipe.course_id.to_s)
      expect(page).to have_text("Make Recipe Public?")
      expect(page).to have_button("Update Recipe")
      expect(page).to have_link("Delete")
      
    end

    it 'correctly updates and displays recipe attributes'
  end
end
