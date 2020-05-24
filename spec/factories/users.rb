FactoryBot.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    document      { Faker::Number.number(digits: 7) }
  end
end
