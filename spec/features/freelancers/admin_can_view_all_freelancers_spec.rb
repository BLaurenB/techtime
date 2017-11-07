require "rails_helper"

describe "As an admin" do
  before do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @freelancers = create_list(:freelancer, 4)
  end

  describe "When I visit the dashboard" do
    scenario "I should see a link to view all items" do

      visit admin_dashboard_path

    expect(page).to have_link("View All Freelancers")

      click_link "View All Freelancers"

    expect(current_path).to eq(admin_freelancers_path)
    end
  end
end
