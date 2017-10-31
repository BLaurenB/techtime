require 'rails_helper'
describe "As a Visitor" do
  describe "when I visit '/:CATEGORY_NAME'" do
    scenario "I can see all freelancers in the category" do
      categories = create_list(:category, 2)

      visit category_path(categories.first)

      expect(page).to have_content(categories.first.freelancers.first.name)
    end
  end  
end
