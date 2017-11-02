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
      default = User.create(username: 'normaluser', password:'password', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

      visit '/'

      fill_in 'user[username]', with: 'normaluser'
      fill_in 'user[password]', with: 'password'
      click_on 'Login'

      expect(current_page).to eq('/dashboard') #must be dashboard
      expect(page).to have_content('Logged in as normaluser')
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
      #And I should see my profile information
    end
  end

end
