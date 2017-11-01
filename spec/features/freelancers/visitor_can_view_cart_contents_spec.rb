require 'rails_helper'

describe "As a visitor" do
  describe "When I add a freelancer to the cart and then click on the cart" do
    before do
      #will need to add category
      @freelancer = create(:freelancer)
      visit freelancers_path
      click_on "Choose Me"

      click_on "Cart"
    end

    scenario "I am redirected to the /cart page and see my cart contents" do
      expect(current_path).to eq('/cart')
      expect(page).to have_css('#image_1')
      expect(page).to have_content(@freelancer.name)
      expect(page).to have_content(@freelancer.description)
      expect(page).to have_content(@freelancer.price)
      expect(page).to have_content("Total")
    end
  end
end

 # When I click “Add to cart” for that item And I click a link or button to view cart And my current path should be “/cart”

 # And I should see a small image, title, description and price for the item I just added And there should be a “total” price for the cart that should be the sum of all items in the cart
