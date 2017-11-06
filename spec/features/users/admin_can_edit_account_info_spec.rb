require "rails_helper"

describe "When I try to edit my account info" do
  describe "As an Admin" do
    scenario "I can edit my own account" do

      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/'
      click_on "Edit My Account"

      expect(current_path).to eq(edit_admin_user_path(admin))

      fill_in "user[username]", with: "Zoey"
      fill_in "user[email]", with: "wise@gmail.com"
      fill_in "user[full_name]", with: "Emily Wise"
      fill_in "user[company]", with: "Google"
      fill_in "user[address1]", with: "Marshall's House"
      fill_in "user[address2]", with: "The Treehouse"
      fill_in "user[city]", with: "Memphis"
      fill_in "user[state]", with: "TN"
      fill_in "user[zip]", with: "37919"
      click_button 'Update Account'

      expect(current_path).to eq(admin_user_path(admin))
      expect(page).to have_content("You have successfully updated your account!")
      expect(page).to have_content("Zoey")
    end

    scenario "I can not edit any other user's information" do
      user_1 = create(:user)
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


      visit admin_user_path(user_1)


      expect(page).to have_content(user_1.username)
      expect(page).to have_content(user_1.address1)
      expect(page).to have_content(user_1.company)
      expect(page).to have_content(user_1.email)
      expect(page).to have_content(user_1.city)
      expect(page).to have_content(user_1.state)
      expect(page).to have_content(user_1.zip)
      expect(page).to_not have_content("Update Account")
    end
  end
end
