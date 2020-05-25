FactoryBot.define do
  factory :project do
    name  { Faker::Company.industry }
    user

    trait :with_task do
      after(:create) do |project|
        create :task, project: project
      end
    end
  end
end
