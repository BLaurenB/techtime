FactoryBot.define do
  factory :category do
    sequence(:title)        { |n| "title_#{n}" }
  end
end
