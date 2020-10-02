require 'rails_helper'

describe "User Sign Up" do
  it 'has the right path' do
    visit '/signup'
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Account Required to Proceed")

    expect(page).to have_content("Create Account")
  end

  it 'shows user form' do
    visit '/signup'

    expect(page).to have_field("user[name]")
    expect(page).to have_field("user[email]")
    expect(page).to have_field("user[password]")
    expect(page).to have_field("user[password_confirmation]")
    expect(page).to have_content("Create Account")
  end

  it 'rejects blank form inputs' do
    visit '/signup'
    click_button("Create Account")

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  describe 'Checks For Unique Credientals' do

    it 'rejects a non-unique user name' do
      visit '/signup'
  
      fill_in "user_name", with: 'test1'
      fill_in "user_email", with: '12345@me.com'
      fill_in 'user_password', with: '123456789'
      fill_in 'user_password_confirmation', with: '123456789'
      click_button('Create Account')
  
      expect(page).to have_content("Name has already been taken")
    end

    it 'rejects a non-unique email' do
      visit '/signup'
  
      fill_in "user_name", with: 'test1'
      fill_in "user_email", with: 'test1@me.com'
      fill_in 'user_password', with: '123456789'
      fill_in 'user_password_confirmation', with: '123456789'
      click_button('Create Account')
  
      expect(page).to have_content("Email has already been taken")
    end

    it 'rejects non-matching passwords' do
      visit '/signup'
  
      fill_in "user_name", with: 'test8'
      fill_in "user_email", with: 'strawberries@gamil.com'
      fill_in "user_password", with: '12345'
      fill_in "user_password_confirmation", with: '123' 
      click_button('Create Account')
  
      expect(page).to have_content("Password confirmation doesn't match")
    end

    it 'rejects passwords less than 9 characters long' do
      visit '/signup'

      fill_in 'user_name', with: 'test1'
      fill_in 'user_email', with: '12345@me.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
  
      click_button('Create Account')
      expect(page).to have_content("Password is too short (minimum is 9 characters)")
    end
  end

  
  
  it 'successuflly creates user' do
    visit '/signup'

    fill_in 'user_name', with: 'wonderbaby'
    fill_in 'user_email', with: 'test22@me.com'
    fill_in 'user_password', with: '123456789'
    fill_in 'user_password_confirmation', with: '123456789'
    click_button('Create Account')
    expect(page).to have_content('Welcome wonderbaby')
  end
end