require "rails_helper"

describe "As an admin" do
  before do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @freelancers = create_list(:freelancer, 4)
    @freelancer_inactive = create(:freelancer, status: 1)
    @freelancer_targeted = create(:freelancer)
  end

  describe "When I visit the dashboard" do
    scenario "I should see a link to view all items" do

      visit admin_dashboard_path

    expect(page).to have_link("Freelancers")

      click_link "Freelancers"

    expect(current_path).to eq(admin_freelancers_path)
    end
  end

  describe "When I visit the admin items page" do
    scenario "I should see a table with all the items(active and inactive)" do

      visit admin_freelancers_path


      expect(page).to have_content(@freelancer_targeted.name)
      expect(page).to have_content(@freelancer_targeted.description)
      expect(page).to have_content(@freelancer_targeted.status)
      expect(page).to have_content(@freelancer_inactive.name)
      expect(page).to have_content(@freelancer_inactive.description)
      expect(page).to have_content(@freelancer_inactive.status)
      expect(page).to have_link("Edit")
    end
  end
end
