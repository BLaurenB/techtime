FactoryBot.define do
  factory :category do
    sequence(:title)        { |n| "Title #{n}"}
    freelancer 
  end
end
