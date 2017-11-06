FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "username_#{n}"}
    password "123"
    email "user@gmail.com"
    company "Google"
    address1 "123 Fourth Street"
    address2 "Suite 5"
    city "Denver"
    state "CO"
    zip 37919
  end
end
