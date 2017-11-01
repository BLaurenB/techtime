require 'rails_helper'

xdescribe "As a visitor" do
  describe "When I click on the cart" do
    before do
        #Will need to add a category
        freelancer = create(:freelancer)
        visit freelancers_path
        click_on "Cart"
    end

    scenario "I am redirected to a /cart page and see my cart contents" do

    end


  end
end 
 #When I click a link for the cart, And my current path should be “/cart” And I should see a small image, title, description and price for the item I just added And there should be a “total” price for the cart that should be the sum of all items in the cart
