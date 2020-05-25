FactoryBot.define do
  factory :task do
    description    { 'task description' }
    deadline       { Time.zone.today }
    project
  end
end
