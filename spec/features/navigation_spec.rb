require 'rails_helper'

describe 'Navigation' do
  it 'clicking on logo takes you to all recipes' do
    visit '/recipes/5'
    click_link('Glowing Spork Recipes')
    expect(current_path).to eq(root_path)
  end

  xit 'Top Rated takes user to all recipes sorted by rating'

  it 'shows all recipe catagories in nav dropdown' do
    visit '/'
    categories = Category.all.collect { |c| c.name }.join(" ")
  
    expect(page).to have_text(categories)
  end

  describe 'navigation for non-authenticated users' do
    it 'non-logged in user sees buttons to login or signup in navigation' do
      visit '/'
      
      expect(page).to have_link('Sign Up')
      expect(page).to have_link('Log In')
      expect(page).not_to have_link('Settings')
      expect(page).not_to have_link('Log Out')
    end

    it 'My Recipes takes a non-logged in user to login' do
      visit '/'

      click_link('My Recipes')
      expect(current_path).to eq('/login')
    end
  end

  describe 'navigation for authenticated users' do
    before do
      visit '/login'
      fill_in 'email', with: 'test5@me.com'
      fill_in 'password', with: '123456789'
      click_button('Log In')
      expect(page).to have_content('Welcome back, test5')
    end

    it 'logged in user sees buttons to log out or view settings in navigation' do
      expect(page).to have_link('Settings')
      expect(page).to have_link('Log Out')
      expect(page).not_to have_link('Sign Up')
      expect(page).not_to have_link('Log In')
    end

    it 'My Recipes takes a logged in user to their user show page' do
      click_link('My Recipes')
      expect(page).to have_content('test5')
    end
  
    it 'logged in non-admin user cannot modify url to navigate to admin page' do
      visit '/users'
      
      expect(page).to have_content('Unauthorized Access')
      expect(current_path).to eq('/')
    end

    it 'logged in user can log out ' do
      click_link('Log Out')
      expect(page).to have_content('Successfullly Loged Out!')
      expect(current_path).to eq('/')
    end
  end

  describe 'navigation for authenticated users' do
    before do
      visit '/logout'
      visit '/login'
      fill_in 'email', with: 'test6@me.com'
      fill_in 'password', with: '123456789'
      click_button('Log In')
      expect(page).to have_content('Welcome back, test6')
    end

    it "admin can modify url to navigate to '/users' page" do
      visit '/users'
      
      expect(page).to have_content('All Users')
      expect(current_path).to eq('/users')
    end
  end
end


