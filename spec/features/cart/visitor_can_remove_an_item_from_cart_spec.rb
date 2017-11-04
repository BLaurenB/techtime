require 'rails_helper'

describe "As a visitor" do
  describe " When I visit /cart" do
    scenario "I can remove an item from the cart" do
      freelancer = create(:freelancer, price: 100)
      visit freelancers_path
      click_on "Choose Me"

      visit cart_path


      expect(page).to have_content(freelancer.name)

      click_link "Remove #{freelancer.name}'s time from your cart."


      expect(current_path).to eq(cart_path)

      expect(page).to have_content("Successfully removed #{freelancer.name} from your cart.")
      #check to see that it is styled in green message
      expect(page).to_not have_content("#{freelancer.price}/hr")
      expect(page).to have_content("Total: $0")
    end

    scenario "I can click link in remove message to view the freelancer's page" do

      freelancer = create(:freelancer, price: 100)
      visit freelancers_path
      click_on "Choose Me"

      visit cart_path

      click_link "Remove #{freelancer.name}'s time from your cart."

      within(".remove") do
        click_link  "#{freelancer.name}"
      end

      expect(current_path).to eq(freelancer_path(freelancer))
    end
  end
end
