FactoryBot.define do
  factory :comment do
    comment { Faker::Book.title }
    url { Faker::Internet.url }
    task
  end
end
