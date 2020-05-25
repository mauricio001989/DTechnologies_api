FactoryBot.define do
  factory :project do
    name  { Faker::Company.industry }
    user
  end
end
