require 'rails_helper'

describe "As an authenticated Admin user" do

  before do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    user = create(:user)

    @freelancer_1 = create(:freelancer)
    @freelancer_2 = create(:freelancer)

    @order = user.orders.create(status: "Paid")

    2.times {@order.freelancers << @freelancer_2}
    @order.freelancers << @freelancer_1

    visit admin_order_path(@order)
  end


  describe "When I visit an individual order page" do
    scenario "I can see the order's date and time, and Status" do
      expect(page).to have_content(@order.created_at)
      expect(page).to have_content("Paid")
    end

    scenario " I can see the purchaser's full name and address" do
      expect(page).to have_content("Name: FullName1")
      #need to update all the dependent pages like new, edit in addition to csv.
      expect(page).to have_content("Google")
      expect(page).to have_content("123 Fourth Street")
      expect(page).to have_content("Suite 5")
      expect(page).to have_content("Denver")
      expect(page).to have_content("CO")
      expect(page).to have_content("37919")
    end

  end

  describe "I see for each Freelancer on the order" do

    xscenario "the Freelancer's name and a link to their page" do
      expect(page).to have_content("Freelancer Name 1")
      click_on "View Freelancer"
      expect(current_path).to eq(freelancer_path(@freelancer_1))
    end

    xscenario "I see the hours purchased, the price, subtotal, and total" do
      expect(page).to have_content("$150")
      expect(page).to have_content("$300")
      expect(page).to have_content("$450")
      expect(page).to have_content("2 hours")
    end

  end
end
