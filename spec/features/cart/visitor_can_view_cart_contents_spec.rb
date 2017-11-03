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

    scenario "I should not see a checkout button" do
      expect(page).to have_content(@freelancer.name)
      within ".login-to-checkout" do
        expect(page).to have_content("Login or Create Account to Checkout")
      end
      expect(page).to_not have_css(".checkout")
    end

    context "and I am a registered user"
    describe "then I login and revisit the cart" do
      scenario "I expect the cart to have the contents saved from when I was a visitor" do
        click_link "Login or Create Account to Checkout"

        expect(current_path).to eq(login_path)
        user = User.create(username: 'normaluser', password: 'password', email: "email@email.com", company: "Company", address1: "Address1", city: "Denver", state: "CO", zip:"80303", role: 0)

        fill_in "session[username]", with: user.username
        fill_in "session[password]", with: user.password
        click_button 'Login'

        visit cart_path
        expect(page).to have_content(@freelancer.name)
        expect(page).to have_content(@freelancer.description)
        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("#{@freelancer.price}/hr")
        expect(page).to have_content("Total: $100")
      end
    end

    context "and I am not a registered user"
    describe "then I create an account and revisit the cart" do
      scenario "I expect the cart to have the contents saved from when I was a visitor" do
        click_link "Login or Create Account to Checkout"
        click_link "Create Account"

        fill_in "user[username]", with: "Emily"
        fill_in "user[password]", with: "123"
        fill_in "user[email]", with: "wise@gmail.com"
        fill_in "user[company]", with: "Google"
        fill_in "user[address1]", with: "Marshall's House"
        fill_in "user[address2]", with: "The Treehouse"
        fill_in "user[city]", with: "Memphis"
        fill_in "user[state]", with: "TN"
        fill_in "user[zip]", with: "37919"
        click_button 'Create Account'

        click_button "Create Account"

        visit cart_path
        expect(page).to have_content(@freelancer.name)
        expect(page).to have_content(@freelancer.description)
        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("#{@freelancer.price}/hr")
        expect(page).to have_content("Total: $100")
      end
    end
  end
end
