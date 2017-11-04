require 'rails_helper'

describe "When I visit an order" do
  context "As an authenticated user" do
    scenario "I see each freelancer with quantity and subtotal" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      order = create(:order)
      # category = create(:category)
      attributes = attributes_for(:freelancer)

      order.freelancers.create(attributes)
      # order.freelancers.create(name: "megan", price: 150, category: category,  )

      visit order_path(order)

      expect(page).to have_content(" name")
      expect(page).to have_content("Quantity: 1 hour")
      expect(page).to have_content("Subtotal: $150")
    end
  end
end
