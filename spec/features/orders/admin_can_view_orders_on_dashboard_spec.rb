require 'rails_helper'

describe "As an admin" do
  describe "when I visit the dashboard," do
    before do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      @order_1 = create(:order, status: 0)
      @order_2 = create(:order, status: 1)
      @order_3 = create(:order, status: 2)
      @order_4 = create(:order, status: 3)
      @order_5 = create(:order, status: 0)
      visit admin_dashboard_path
    end

    scenario "I see a list of all orders" do

      save_and_open_page
      expect(page).to have_content(@order_1.id)
      expect(page).to have_content(@order_1.status)
      expect(page).to have_content(@order_4.id)
      expect(page).to have_content(@order_4.status)
    end

    scenario "I can see the total number of orders for each status" do
      expect(page).to have_content("Ordered: 2")
      expect(page).to have_content("Paid: 1")
      expect(page).to have_content("Canceled: 1")
      expect(page).to have_content("Completed: 1")
    end
  end
end

# As an Admin When I visit the dashboard
# Then I can see a listing of all orders
# And I can see the total number of orders for each status (“Ordered”, “Paid”, “Cancelled”, “Completed”)
# And I can see a link for each individual order
