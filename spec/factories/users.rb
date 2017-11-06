FactoryBot.define do
  factory :user do
    sequence(:username)  {|n| "username_#{n}"}
    sequence(:full_name) {|n| "FullName#{n}"}
    password "password"
    email "user@gmail.com"
    company "Google"
    address1 "123 Fourth Street"
    address2 "Suite 5"
    city "Denver"
    state "CO"
    zip 37919
    role 0
  end
end
