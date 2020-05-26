FactoryBot.define do
  factory :task do
    description    { 'task description' }
    deadline       { Time.zone.today }
    project

    trait :with_comment do
      after(:create) do |task|
        create :comment, task: task
      end
    end
  end
end
