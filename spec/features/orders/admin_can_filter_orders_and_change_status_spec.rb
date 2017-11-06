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

      within ".filtered-orders" do
        expect(page).to have_content(@order_1.id)
        expect(page).to have_content(@order_5.id)
        expect(page).to_not have_content(@order_2.id)
        expect(page).to_not have_content("Cancelled")
      end
    end

    scenario "I can change the status of an order to cancelled" do
      expect(page).to have_content("Ordered: 2")

      within ".order-1" do
        expect(page).to have_content("Status: Ordered")
        click_on "Cancel"
      end

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Ordered: 1")

      within ".order-1" do
        expect(page).to have_content("Status: Cancelled")
      end
    end

    scenario "I can change the status of an order to paid" do
      expect(page).to have_content("Ordered: 2")
      expect(page).to have_content("Paid: 1")

      within ".order-5" do
        click_on "Mark as Paid"
      end

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Ordered: 1")
      expect(page).to have_content("Paid: 2")

      within ".order-5" do
        expect(page).to have_content("Status: Paid")
      end
    end

    scenario "I can change the status of an order to completed" do
      expect(page).to have_content("Paid: 1")
      expect(page).to have_content("Completed: 1")

      within ".order-2" do
        click_on "Mark as Completed"
      end

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Paid: 0")
      expect(page).to have_content("Completed: 2")

      within ".order-2" do
        expect(page).to have_content("Status: Completed")
      end
    end

  end
end
