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
    fill_in "user[email]", with: "wise@gmail.com"
    fill_in "user[company]", with: "Google"
    fill_in "user[address1]", with: "Marshall's House"
    fill_in "user[address2]", with: "The Treehouse"
    fill_in "user[city]", with: "Memphis"
    fill_in "user[state]", with: "TN"
    fill_in "user[zip]", with: "37919"
    click_button 'Create Account'


    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as Emily")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
    expect(User.last.role).to eq("default")
    expect(User.last.role).to_not eq("admin")
  end
end
