require 'rails_helper'

  describe "Visitor goes to categories index" do

    before do
      @categories = create_list(:category, 3)
      visit categories_path
    end

    scenario " and can see a list of all categories" do
      expect(page).to have_content(@categories[0].title)
      expect(page).to have_content(@categories[2].title)
    end

    scenario " and when category is clicked, they are taken to the category show page" do
      click_on "#{@categories[1].title}"
      expect(current_path).to eq("/categories/#{@categories[1].title}")
    end
  end
