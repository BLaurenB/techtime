require 'rails_helper'


describe "As a Visitor" do
  describe "when I visit '/freelancers' I can all freelancers" do

    scenario "I see existing freelancers" do
      freelancer = create_list(:freelancer, 3)

      visit freelancers_path
      save_and_open_page
      expect(page).to have_content(freelancer[0].name)
      expect(page).to have_content(freelancer[2].name)
      expect(page).to have_content(freelancer[0].description)
      expect(page).to have_content(freelancer[2].description)
      expect(page).to have_content(freelancer[0].price)
      expect(page).to have_content(freelancer[2].price)

      #We still need to check that the images appear
    end


  end


end
