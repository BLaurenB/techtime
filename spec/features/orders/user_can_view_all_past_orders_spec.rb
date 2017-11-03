require "rails_helper"

describe "When I visit Orders" do
  context "As an Authenticated User" do
    scenario "I see all orders belonging to me" do
      user_1 = create(:user)
      user_2 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      user_1.orders.create!(status: "ordered")
      user_1.orders.create!(status: "paid")
      user_1.orders.create!(status: "completed")
      user_2.orders.create!(status: "cancelled")

      visit orders_path


      expect(page).to have_content("ordered")
      expect(page).to have_content("paid")
      expect(page).to have_content("completed")
      expect(page).to_not have_content("cancelled")

    end

    scenario "I click a link to view an order" do
      user_1 = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      order = user_1.orders.create!(status: "ordered")

      visit orders_path

      click_on "View Details"

      expect(current_path).to eq(order_path(order))
    end
  end
end
