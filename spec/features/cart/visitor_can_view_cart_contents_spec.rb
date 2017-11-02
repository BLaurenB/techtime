require 'rails_helper'

describe "As a visitor" do
  describe "When I add a freelancer to the cart and then click on the cart" do
    before do

      @freelancer = create(:freelancer, price: 100)
      visit freelancers_path
      click_on "Choose Me"

      click_on "Cart"
      
    end

    scenario "I am redirected to the /cart page and see my cart contents" do
      expect(current_path).to eq('/cart')
      expect(page).to have_css('#image_1')
      expect(page).to have_content(@freelancer.name)
      expect(page).to have_content(@freelancer.description)
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("#{@freelancer.price}/hr")
      expect(page).to have_content("Total: $100")
      
    end
  end
end
