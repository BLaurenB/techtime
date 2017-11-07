require 'rails_helper'

describe "As a Visitor" do
  describe "when I visit '/freelancers' I can see all freelancers" do
    scenario "I see existing freelancers" do
      freelancer = create_list(:freelancer, 3)

      visit freelancers_path

      expect(page).to have_content(freelancer[0].name)
      expect(page).to have_content(freelancer[2].name)
      expect(page).to have_content(freelancer[0].description)
      expect(page).to have_content(freelancer[2].description)
      expect(page).to have_content(freelancer[0].price)
      expect(page).to have_content(freelancer[2].price)
      expect(page).to have_css("img[src*='pexels-photo-415829.jpeg']")
    end

    scenario "I see retired freelancers and cannot add them to cart" do
      create_list(:freelancer, 2)
      create(:freelancer, status: "retired")

      visit freelancers_path

      expect(page).to have_content("Freelancer Retired", count: 1)
    end
  end
end
