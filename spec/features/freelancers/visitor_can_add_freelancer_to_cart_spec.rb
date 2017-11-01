require 'rails_helper'

xdescribe "As a visitor" do
  describe "When I visit any page with an item on it" do
    before do
        #Will need to add a category
        @freelancer = create(:freelancer)
        visit freelancers_path
    end

    scenario "I should see a button for 'Choose Me!'" do
      expect(page).to have_button("Choose Me!")
    end


    describe "I click on 'Choose Me!'" do
      scenario "a freelancer is added to the Cart" do

        expect(page).to have_content("Cart: 0")
        click_on "Choose Me!"
        save_and_open_page
        expect(page).to have_content("Cart: 1")
      end

      scenario "a message is displayed" do
        click_on "Choose Me!"
        expect(page).to have_content("You now have 1 hour of #{@freelancer.name}'s time in your cart.")
        click_on "Choose Me!"
        expect(page).to have_content("You now have 2 hours of #{@freelancer.name}'s time in your cart.")
      end
    end
  end
end
