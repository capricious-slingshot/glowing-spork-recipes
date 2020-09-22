require 'rails_helper'

describe "User Login" do
  it 'has the right path' do
    visit root_url
    click_link 'Login'

    expect(current_path).to eq(new_session_path)
  end

  it 'prompts for an email and password' do
    visit root_url
    click_link 'Login'

    expect(page).to have_field("email")
    expect(page).to have_field("password")
  end
    

end