require "rails_helper"
describe "As a registered user" do
  scenario "I cannot view information of other users" do
    user_1 = User.create(username: 'firstuser', password: 'password', email: "email@email.com", full_name: "Bob Smith", company: "Company", address1: "Address1", city: "Denver", state: "CO", zip:"80303", role: 0)
    user_2 = User.create(username: 'seconduser', password: 'password', email: "email@gmail.com", full_name: "Bill Smith", company: "Company", address1: "Address1", city: "Denver", state: "CO", zip:"80303", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)


    user_1.orders.create(status: 0)
    user_1.orders.create(status: 3)
    user_2.orders.create(status: 0)

    visit '/orders/1'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  scenario "I can not view any admin views" do
    user_1 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit '/admin/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
