require 'rails_helper'


describe "As a visitor" do
  describe "When I visit '/cart' with items in it" do
    before do
      @freelancer = create(:freelancer, price: 100)
      visit freelancers_path
      click_on "Choose Me"
      click_on "Cart"
    end

    scenario "I can increase the quantity of an item" do
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: $100")
      expect(page).to have_content("Total: $100")

      click_button "Increase Amount"

      expect(current_path).to eq("/cart")
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: $200")
      expect(page).to have_content("Total: $200")

    end

    scenario "I can decrease the quantity of an item" do
      click_button "Increase Amount"
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: $200")
      expect(page).to have_content("Total: $200")

      click_button "Decrease Amount"


      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: $100")
      expect(page).to have_content("Total: $100")
    end
  end
end












=begin
Background: My cart has an item in it

As a visitor When I visit “/cart” Then I should see my item with a quantity of 1 And when I increase the quantity Then my current page should be ‘/cart’ And that item’s quantity should reflect the increase And the subtotal for that item should increase And the total for the cart should match that increase
=end
