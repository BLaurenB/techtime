require "rails_helper"
describe "As a registered user" do
  scenario "I cannot view information of other users" do
    user_1 = create(:user)
    user_2 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    user_1.orders.create!
    user_1.orders.create!(status: 1)
    user_1.orders.create!(status: 3)
    user_2.orders.create!(status: 2)

    visit orders_path

    expect(page).to_not have_content("Cancelled")
  end

  # scenario "I can not view any admin views" do
  #   user_1 = create(:user)
  #
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
  #
  #   visit '/admin/dashboard'
  #
  #   expect(page).to have_http_status(404)
  # end
end
