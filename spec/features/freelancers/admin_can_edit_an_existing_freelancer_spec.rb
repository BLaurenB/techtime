require 'rails_helper'

describe "As an Admin" do
  before do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    @freelancer_targeted = create(:freelancer)
  end
  describe "When I visit the admin items page" do
    describe "and I click on the edit link" do
    scenario "I should be redirected to the edit page" do

      visit admin_freelancers_path

      click_link "Edit"

      expect(current_path).to eq(edit_admin_freelancer_path(@freelancer_targeted))
    end

    scenario "then I can update the information" do
      fill_in "freelancer[name]", with: "Zoey"
      fill_in "freelancer[description]", with: "The best designer"
      fill_in "freelancer[image]", with: "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?w=940&h=650&auto=compress&cs=tinysrgb"
      fill_in "freelancer[status]", with: "retired"
      click_button 'Update Account'

    expect(current_path).to eq(freelancer_path(@freelancer_targeted))
    expect(page).to have_content("Zoey")
    expect(page).to have_content("best designer")
    expect(page).to have_content("retired")
    end
  end
end
end
