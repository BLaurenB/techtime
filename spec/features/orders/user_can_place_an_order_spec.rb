require 'rails_helper'

describe "As a user when I have freelancers in my cart" do
  describe "When I click checkout" do
    before do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      create(:freelancer, price: 100)
      visit freelancers_path
      click_on "Choose Me"
      click_on "Cart"
    end

    scenario "my order is placed" do
      expect(page).to have_content("Cart: 1")
      click_button "Checkout"

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("Cart: 0")
      expect(page).to have_content("Order was successfully placed!")
    end

    scenario "I see the order details in a table" do
      click_button "Checkout"


      expect(page).to have_content(1)
      expect(page).to have_content("Ordered")
    end
  end
end
