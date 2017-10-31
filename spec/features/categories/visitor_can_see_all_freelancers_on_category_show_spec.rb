require 'rails_helper'

describe "As a Visitor" do
  describe "when I visit '/:CATEGORY_NAME'" do
    scenario "I can see all freelancers in the category" do
      category_1 = create(:category)
      category_2 = create(:category)
      create(:freelancer, category: category_1)
      create(:freelancer, category: category_2)

      visit category_path(category_1)

      expect(current_path).to eq("/categories/#{category_1.title}")

      expect(page).to have_content(category_1.freelancers.first.name)
      expect(page).to_not have_content(category_2.freelancers.first.name)
    end

    context "the URL should translate a space in the title to an underscore"
    scenario "I see all freelancers" do
      category_1 = Category.create!(title: "web development")
      create(:freelancer, category: category_1)

      visit category_path(category_1)

      expect(current_path).to eq("/categories/web_development")
    end
  end
end
