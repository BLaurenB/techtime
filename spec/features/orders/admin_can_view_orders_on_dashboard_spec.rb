require 'rails_helper'

describe "As an admin" do
  describe "when I visit the dashboard," do
    scenario "I see a list of all orders" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      orders = create_list(:order, 5)

      visit admin_dashboard_path

      expect(page).to have_content(orders[4].id)
      expect(page).to have_content(orders[4].status)
      expect(page).to have_content(orders[0].id)
      expect(page).to have_content(orders[0].status)
      expect(page).to have_content(orders[2].id)
      expect(page).to have_content(orders[2].status)
    end
  end
end

# As an Admin When I visit the dashboard
# Then I can see a listing of all orders
# And I can see the total number of orders for each status (“Ordered”, “Paid”, “Cancelled”, “Completed”)
# And I can see a link for each individual order
