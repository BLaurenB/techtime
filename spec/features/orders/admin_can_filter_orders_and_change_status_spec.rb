require 'rails_helper'

describe "As an Admin" do
  describe "when I visit the dashboard" do
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

    scenario "I can filter orders by their status" do
      click_on "Ordered"

      expect(current_path).to eq(admin_dashboard_path)
      save_and_open_page

      within ".filtered-orders" do
        expect(page).to have_content(@order_1.id)
        expect(page).to have_content(@order_5.id)
        expect(page).to_not have_content(@order_2.id)
        expect(page).to_not have_content("Canceled")
      end
    end

    scenario "I can change the status of an order" do

    end

  end
end
