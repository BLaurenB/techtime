require 'rails_helper'

describe "When I visit an order" do
  context "As an authenticated user" do
    scenario "I see each freelancer with quantity and subtotal" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      freelancer_1 = create(:freelancer)
      freelancer_2 = create(:freelancer)
      order = user.orders.create(status: "Paid")

      2.times {order.freelancers << freelancer_2}
      order.freelancers << freelancer_1
    # require 'pry'; binding.pry

      visit order_path(order)
      save_and_open_page

      expect(page).to have_content("Name")
      expect(page).to have_content("Quantity: 1 hour")
      expect(page).to have_content("Subtotal: $150")
    end
  end
end
