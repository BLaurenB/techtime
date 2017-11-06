require 'rails_helper'


describe "As a registered user" do
  describe "when I visit '/'" do
    scenario "I see a login button that takes me to a login page" do
      visit '/'
      expect(page).to have_content('Login')
      click_on 'Login'
      expect(current_path).to eq('/login')
    end

    scenario "I can fill in my credentials" do

      user = User.create(username: 'normaluser', password: 'password', email: "email@email.com", full_name: "Bob Smith", company: "Company", address1: "Address1", city: "Denver", state: "CO", zip:"80303", role: 0)

      visit '/'

      click_link 'Login'



      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button 'Login'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Logged in as normaluser')
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")


    end
  end

end
