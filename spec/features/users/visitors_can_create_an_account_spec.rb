require 'rails_helper'

describe "As a Visitor" do
  describe "when I visit '/'" do
    scenario "I see login" do
    visit '/'

    click_on 'Login'
    expect(current_path).to eq('/login')
    expect(page).to have_content('Create Account')
  end
end

  scenario "I can fill in my information" do
    visit '/'
    click_on 'Login'
    click_on 'Create Account'
  

    fill_in "user[username]", with: "Emily"
    fill_in "user[password]", with: "123"
    click_button 'Create Account'


    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as Emily")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end
end
