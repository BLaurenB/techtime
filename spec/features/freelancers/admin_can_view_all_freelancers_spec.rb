require "rails_helper"

describe "As an admin" do
  describe "When I visit the dashboard" do
    before do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      @freelancers = create_list(:freelancer, 4)
    end

    scenario "I should see a link to view all items" do

      visit admin_dashboard_path

    expect(page).to have_link("View All Freelancers")
    end
  end
end  
