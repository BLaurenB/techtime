require "rails_helper"
describe "When I visit a freelancer page" do
  describe "As a visitor" do
    scenario "I can view retired freelancers but can't add to cart" do

      freelancer = create(:freelancer, status: "retired")

      visit freelancer_path(freelancer)

      expect(page).to have_content("Freelancer Retired")
      expect(page).to_not have_content("Choose Me!")
    end

    context "Freelancers are active by default"
    scenario "I can view active freelancers and add to cart" do

      freelancer = create(:freelancer)

      visit freelancer_path(freelancer)

      expect(page).to have_content("Choose Me!")
      expect(page).to_not have_content("Freelancer Retired")
    end
  end
end
