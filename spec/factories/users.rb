FactoryBot.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    document      { Faker::Number.number(digits: 7) }

    trait :with_project do
      after(:create) do |user|
        create :project, user: user
      end
    end
  end
end
