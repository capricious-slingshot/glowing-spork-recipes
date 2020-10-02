require 'rails_helper'

describe "User Log In" do
  it 'has the right path' do
    visit '/'
    expect(page).to have_text('Glowing Spork Recipes')
    expect(page).to have_link('Sign Up')
    expect(page).to have_link('Log In')
    click_link 'Log In'

    expect(current_path).to eq(new_session_path)
  end

  it 'prompts for an email and password' do
    visit '/login'
    
    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end

  it 'has both conventional login and gitgub Oauth' do
    visit '/login'

    expect(page).to have_link('Log In')
    expect(page).to have_link("Log In with Github", href: "/auth/github")
    expect(page).to have_link("Sign Up", href: "/signup")
  end

  it 'rejects incorrect log in attempt' do
    visit '/login'
    fill_in 'email', with: '12345@me.com'
    fill_in 'password', with: '12345'
    click_button('Log In')
    expect(page).to have_content('Invalid Credientals')
  end
  
  it 'successuflly logs in user' do
    visit '/login'
    fill_in 'email', with: 'test1@me.com'
    fill_in 'password', with: '1234'
    click_button('Log In')
    expect(page).to have_content('Welcome back, test1')
  end
end