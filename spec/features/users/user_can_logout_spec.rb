require 'rails_helper'

describe "As a User" do
  scenario "When I click logout" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit cart_path
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")

    click_on "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login")
  end
end
