require 'rails_helper'

  describe "As an Admin" do

    before do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    end

    describe "When I visit the Freelancer page" do
      scenario "I see a link to create a new freelancer" do

        visit freelancers_path

        expect(page).to have_content("Add a New Freelancer")


        click_on 'Add a New Freelancer'
        expect(current_path).to eq(new_admin_freelancer_path)
      end
    end

    scenario "I can create a new freelancer" do

      visit freelancers_path

      click_on 'Add a New Freelancer'

      fill_in "freelancer[name]", with: "Emily"
      fill_in "freelancer[description]", with: "Backend Developer with 10 years of experience"
      fill_in "freelancer[price]", with: 200
      fill_in "freelancer[category]", with: "Backend Development"

      click_button 'Create Freelancer Profile'

      expect(current_path).to eq(admin_freelancer_path(Freelancer.last.id))
      expect(page).to have_content("Emily")
      expect(page).to have_content("Backend Developer with 10 years of experience")
      expect(page).to have_content("200.00")
      expect(page).to have_content("Backend Development")
    end
  end
