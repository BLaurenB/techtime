require 'rails_helper'

  describe "As an Admin" do

    before do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      @category = Category.create(title: "Backend Development")
    end

    describe "When I visit the Freelancer page" do
      scenario "I see a link to create a new freelancer" do

        visit admin_freelancers_path



        expect(page).to have_content("Add a New Freelancer")


        click_on 'Add a New Freelancer'
        expect(current_path).to eq(new_admin_freelancer_path)
      end
    end

    scenario "I can create a new freelancer" do

      visit admin_freelancers_path

      click_on 'Add a New Freelancer'

      fill_in "freelancer[name]", with: "Emily"
      fill_in "freelancer[description]", with: "Backend Developer with 10 years of experience"
      fill_in "freelancer[price]", with: 200
      select('Backend Development', from: "freelancer_category")

      click_button 'Create Freelancer Profile'

      save_and_open_page

      expect(current_path).to eq(freelancer_path(Freelancer.last.id))
      expect(page).to have_content("Emily")
      expect(page).to have_content("Backend Developer with 10 years of experience")
      expect(page).to have_content("200/ hr")

    end
  end
