require "rails_helper"

describe " As an Admin," do
  scenario "when I log in, I am taken to an admin dashboard" do
    admin = create(:user, role: 1)

    visit '/login'

    fill_in "session[username]", with: admin.username
    fill_in "session[password]", with: admin.password
    click_button "Login"

    expect(current_path).to eq('/admin/dashboard')
  end

  scenario "when I am logged in, I see the dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/admin/dashboard"

    expect(page).to have_content("Admin Dashboard")
  end

end
