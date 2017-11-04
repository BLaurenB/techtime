FactoryBot.define do
  factory :freelancer do
    sequence(:name)        { |n| "Freelancer Name #{n}"}
    sequence(:description) { |n| "Freelancer Description #{n}"}
    price                   150
    image "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?w=940&h=650&auto=compress&cs=tinysrgb"

    category
  end
end
