FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "username_#{n}"}
    password "123"
    email "user@gmail.com"
    company "Google"
    address1 "treehouse"
    address2 "Basement"
    city "Denver"
    state "CO"
    zip 37919
  end
end
